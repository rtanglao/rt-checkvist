---
layout: post
title: "Changed the gps python music script to use AVAudioPlayer so that it would play sound through the iPhone's built-in speakers instead of only working over Bluetooth "
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Nov 8, 2026 15:05 (UTC) [Changed the gps python music script to use AVAudioPlayer so that it would play sound through the iPhone's built-in speakers instead of only working over Bluetooth ](https://github.com/rtanglao/gps-music-pythonista/issues/2) <-- Without this change, sound would only be played over Bluetooth. Shows the living nature of software or something :-) The underlying software frameworks change and if your software development environment doesn't keep up, then things will just stop working.

* Pythonista needs to fix this  shrug :-)

### Previously

- November 7, 2026 [gps-music.py play random music based on GPS lat/lon](https://rolandtanglao.com/2026/11/07/p0841-gps-music-pythonista-play-random-music-files-lat-lon/)

### Updated Python code for: gps_music.py

Because my blog will last longer than github :-) herewith the code for [gps_music.py](https://github.com/rtanglao/gps-music-pythonista/blob/main/gps_music.py)

```
python
#!/usr/bin/env python3
"""
gps_music.py - Location-based ambient audio playback for Pythonista 3.

Runs an event loop that, once every 2 seconds, fetches the device's GPS
coordinates and randomly plays an .aif/.aiff audio file from a designated
directory based on the current location.
"""

from __future__ import annotations

import argparse
import collections
import hashlib
import math
import os
import random
import shutil
import subprocess
import sys
import time
from pathlib import Path
from typing import Dict, List, Optional, Sequence, Tuple

# ==============================================================================
# Default Configuration (can be edited directly or overridden via CLI arguments)
# ==============================================================================
DEFAULT_AUDIO_DIR = "sample_audio"  # Directory containing .aif / .aiff files
DEFAULT_INTERVAL = 2.0              # Interval in seconds between plays
DEFAULT_GRID_SIZE_METERS = 50.0     # Spatial grid cell size in meters (~50m)
DEFAULT_PALETTE_SIZE = 4            # Number of audio files per spatial cell pool
DEFAULT_VOLUME = 1.0                # Volume from 0.0 to 1.0
AUDIO_EXTENSIONS = (".aif", ".aiff", ".AIF", ".AIFF")

# ==============================================================================
# Platform Detection & Native Modules
# ==============================================================================
# Pythonista 3's Objective-C bridge for AVFoundation (AVAudioPlayer & AVAudioSession)
try:
    from objc_util import ObjCClass, nsurl
    AVAudioPlayer = ObjCClass("AVAudioPlayer")
    AVAudioSession = ObjCClass("AVAudioSession")
    HAS_OBJC_AV_AUDIO = True
except Exception:
    AVAudioPlayer = None
    AVAudioSession = None
    nsurl = None
    HAS_OBJC_AV_AUDIO = False

try:
    import location  # Pythonista 3 built-in module
    HAS_PYTHONISTA_LOCATION = True
except ImportError:
    location = None
    HAS_PYTHONISTA_LOCATION = False

try:
    import sound  # Pythonista 3 built-in module
    HAS_PYTHONISTA_SOUND = True
except ImportError:
    sound = None
    HAS_PYTHONISTA_SOUND = False


def setup_audio_session() -> bool:
    """
    Configure the iOS AVAudioSession for background / playback audio so that
    playback continues even if the device's physical mute/silent switch is on.
    """
    if not HAS_OBJC_AV_AUDIO or AVAudioSession is None:
        return False
    try:
        session = AVAudioSession.sharedInstance()
        # AVAudioSessionCategoryPlayback ensures audio plays even if silent switch is on
        session.setCategory_error_("AVAudioSessionCategoryPlayback", None)
        session.setActive_error_(True, None)
        return True
    except Exception as e:
        print(f"[AVAudioSession Warning] Could not configure audio session: {e}", file=sys.stderr)
        return False


def find_audio_files(directory: str ¦ Path, extensions: Sequence[str] = AUDIO_EXTENSIONS) -> List[Path]:
    """Scan directory recursively for files matching the given audio extensions."""
    base_path = Path(directory).expanduser().resolve()
    if not base_path.exists():
        raise FileNotFoundError(f"Audio directory does not exist: {base_path}")
    if not base_path.is_dir():
        raise NotADirectoryError(f"Audio path is not a directory: {base_path}")

    ext_set = {ext.lower() for ext in extensions}
    audio_files = [
        path for path in base_path.rglob("*")
        if path.is_file() and path.suffix.lower() in ext_set
    ]
    audio_files.sort()
    return audio_files


def coord_to_grid(lat: float, lon: float, grid_size_meters: float = DEFAULT_GRID_SIZE_METERS) -> Tuple[int, int]:
    """
    Convert latitude and longitude coordinates into 2D integer grid cell coordinates.
    
    1 degree of latitude is ~111,139 meters.
    1 degree of longitude is ~111,139 * cos(lat) meters.
    """
    meters_per_deg_lat = 111139.0
    lat_step = grid_size_meters / meters_per_deg_lat
    
    # Avoid division by zero near poles
    cos_lat = max(0.0001, math.cos(math.radians(lat)))
    lon_step = grid_size_meters / (meters_per_deg_lat * cos_lat)

    grid_x = int(math.floor(lat / lat_step))
    grid_y = int(math.floor(lon / lon_step))
    return grid_x, grid_y


def get_cell_palette(
    audio_files: Sequence[Path],
    cell: Tuple[int, int],
    palette_size: int = DEFAULT_PALETTE_SIZE,
) -> List[Path]:
    """
    Deterministically select an active subset (palette) of audio files for a grid cell.
    
    When moving within the same grid cell, the active palette remains identical.
    When moving to a different grid cell, the palette changes.
    """
    if not audio_files:
        return []
    if palette_size <= 0 or palette_size >= len(audio_files):
        return list(audio_files)

    cell_key = f"{cell[0]}:{cell[1]}".encode("utf-8")
    seed = int(hashlib.sha256(cell_key).hexdigest()[:8], 16)
    rng = random.Random(seed)
    return rng.sample(list(audio_files), palette_size)


class BaseLocationProvider:
    """Base interface for location providers."""

    def start(self) -> None:
        raise NotImplementedError

    def get_location(self) -> Optional[Dict[str, float]]:
        raise NotImplementedError

    def stop(self) -> None:
        raise NotImplementedError


class PythonistaLocationProvider(BaseLocationProvider):
    """Wraps Pythonista's native location module."""

    def __init__(self) -> None:
        self._started = False

    def start(self) -> None:
        if not self._started and location is not None:
            location.start_updates()
            self._started = True

    def get_location(self) -> Optional[Dict[str, float]]:
        if location is not None:
            return location.get_location()
        return None

    def stop(self) -> None:
        if self._started and location is not None:
            try:
                location.stop_updates()
            except Exception:
                pass
            self._started = False


class SimulatedLocationProvider(BaseLocationProvider):
    """
    Simulates GPS coordinates with slight random walk drift.
    Useful for off-device testing or simulator environments.
    """

    def __init__(
        self,
        start_lat: float = 37.7749,
        start_lon: float = -122.4194,
        drift_meters_per_sec: float = 5.0,
    ) -> None:
        self.lat = start_lat
        self.lon = start_lon
        self.drift_meters = drift_meters_per_sec
        self.last_time = time.monotonic()
        self._started = False

    def start(self) -> None:
        self.last_time = time.monotonic()
        self._started = True

    def get_location(self) -> Dict[str, float]:
        now = time.monotonic()
        dt = max(0.0, now - self.last_time)
        self.last_time = now

        # Drift coordinates by small random steps
        deg_lat_step = (self.drift_meters * dt) / 111139.0
        self.lat += random.uniform(-deg_lat_step, deg_lat_step)
        self.lon += random.uniform(-deg_lat_step, deg_lat_step)

        return {
            "latitude": self.lat,
            "longitude": self.lon,
            "altitude": 10.0,
            "horizontal_accuracy": 5.0,
            "speed": 1.4,
            "timestamp": time.time(),
        }

    def stop(self) -> None:
        self._started = False


class BaseAudioPlayer:
    """Base interface for audio players."""

    def play(self, file_path: Path, volume: float = 1.0) -> None:
        raise NotImplementedError

    def stop_all(self) -> None:
        pass


class AVAudioPlayerAudioPlayer(BaseAudioPlayer):
    """
    Native iOS audio playback using Apple's AVFoundation AVAudioPlayer framework
    via Pythonista 3's objc_util bridge.
    """

    def __init__(self, max_concurrent: int = 8, configure_session: bool = True) -> None:
        self.max_concurrent = max_concurrent
        # Retain references to active AVAudioPlayer instances so Pythonista's GC/ARC does not cut playback short
        self._players: collections.deque = collections.deque(maxlen=max_concurrent)
        if configure_session:
            setup_audio_session()

    def play(self, file_path: Path, volume: float = 1.0) -> None:
        if not HAS_OBJC_AV_AUDIO or AVAudioPlayer is None:
            return

        try:
            abs_path = str(file_path.resolve())
            if nsurl is not None:
                url = nsurl(abs_path)
            else:
                NSURL = ObjCClass("NSURL")
                url = NSURL.fileURLWithPath_(abs_path)

            player = AVAudioPlayer.alloc().initWithContentsOfURL_error_(url, None)
            if player is None:
                print(f"[AVAudioPlayer Error] Could not initialize player for {file_path.name}", file=sys.stderr)
                return

            player.setVolume_(max(0.0, min(1.0, float(volume))))
            player.prepareToPlay()
            started = player.play()
            if not started:
                print(f"[AVAudioPlayer Warning] Playback did not start for {file_path.name}", file=sys.stderr)
            self._players.append(player)
        except Exception as e:
            print(f"[AVAudioPlayer Error] Failed to play {file_path.name}: {e}", file=sys.stderr)

    def stop_all(self) -> None:
        while self._players:
            player = self._players.popleft()
            try:
                player.stop()
            except Exception:
                pass


class PythonistaAudioPlayer(BaseAudioPlayer):
    """Audio playback using Pythonista 3's built-in sound module."""

    def __init__(self, max_concurrent: int = 8) -> None:
        # Keep references to active sound.Player instances so Pythonista's GC doesn't cut sound short
        self._players: collections.deque = collections.deque(maxlen=max_concurrent)

    def play(self, file_path: Path, volume: float = 1.0) -> None:
        if sound is None:
            return
        try:
            player = sound.Player(str(file_path))
            player.volume = max(0.0, min(1.0, volume))
            player.play()
            self._players.append(player)
        except Exception as e:
            print(f"[Player Error] Failed to play {file_path.name}: {e}", file=sys.stderr)

    def stop_all(self) -> None:
        while self._players:
            player = self._players.popleft()
            try:
                player.stop()
            except Exception:
                pass


class DesktopAudioPlayer(BaseAudioPlayer):
    """
    Fallback audio player for macOS (afplay) or console mocking.
    """

    def __init__(self, max_concurrent: int = 8) -> None:
        self.has_afplay = shutil.which("afplay") is not None
        self._processes: collections.deque = collections.deque(maxlen=max_concurrent)

    def play(self, file_path: Path, volume: float = 1.0) -> None:
        if self.has_afplay:
            try:
                # Cleanup finished processes
                self._processes = collections.deque(
                    [p for p in self._processes if p.poll() is None],
                    maxlen=self._processes.maxlen,
                )
                proc = subprocess.Popen(
                    ["afplay", "-v", str(volume), str(file_path)],
                    stdout=subprocess.DEVNULL,
                    stderr=subprocess.DEVNULL,
                )
                self._processes.append(proc)
            except Exception as e:
                print(f"[Desktop Player Error] {e}", file=sys.stderr)
        else:
            # Fallback if no audio tool installed
            print(f"[Mock Audio] Play: {file_path.name} (volume={volume})")

    def stop_all(self) -> None:
        while self._processes:
            p = self._processes.popleft()
            try:
                p.terminate()
            except Exception:
                pass


class GPSMusicApp:
    """Coordinates GPS tracking and periodic audio playback."""

    def __init__(
        self,
        audio_dir: str ¦ Path = DEFAULT_AUDIO_DIR,
        interval: float = DEFAULT_INTERVAL,
        grid_size_meters: float = DEFAULT_GRID_SIZE_METERS,
        palette_size: int = DEFAULT_PALETTE_SIZE,
        volume: float = DEFAULT_VOLUME,
        location_provider: Optional[BaseLocationProvider] = None,
        audio_player: Optional[BaseAudioPlayer] = None,
        audio_backend: str = "auto",
    ) -> None:
        self.audio_dir = Path(audio_dir)
        self.interval = float(interval)
        self.grid_size_meters = float(grid_size_meters)
        self.palette_size = int(palette_size)
        self.volume = float(volume)

        self.audio_files = find_audio_files(self.audio_dir)
        if not self.audio_files:
            raise RuntimeError(
                f"No .aif / .aiff files found in {self.audio_dir.resolve()}."
            )

        if location_provider is not None:
            self.location_provider = location_provider
        elif HAS_PYTHONISTA_LOCATION:
            self.location_provider = PythonistaLocationProvider()
        else:
            print("[Info] Pythonista 'location' module not detected; using simulated GPS coordinates.")
            self.location_provider = SimulatedLocationProvider()

        if audio_player is not None:
            self.audio_player = audio_player
        elif audio_backend == "avplayer":
            if HAS_OBJC_AV_AUDIO:
                self.audio_player = AVAudioPlayerAudioPlayer()
            else:
                print("[Warning] AVAudioPlayer backend requested but not available; checking fallbacks.")
                if HAS_PYTHONISTA_SOUND:
                    self.audio_player = PythonistaAudioPlayer()
                else:
                    self.audio_player = DesktopAudioPlayer()
        elif audio_backend == "sound":
            if HAS_PYTHONISTA_SOUND:
                self.audio_player = PythonistaAudioPlayer()
            else:
                print("[Warning] Pythonista 'sound' backend requested but not available; using desktop player.")
                self.audio_player = DesktopAudioPlayer()
        elif audio_backend == "desktop":
            self.audio_player = DesktopAudioPlayer()
        else:  # "auto"
            if HAS_OBJC_AV_AUDIO:
                self.audio_player = AVAudioPlayerAudioPlayer()
            elif HAS_PYTHONISTA_SOUND:
                self.audio_player = PythonistaAudioPlayer()
            else:
                self.audio_player = DesktopAudioPlayer()

        self._current_cell: Optional[Tuple[int, int]] = None
        self._current_palette: List[Path] = []
        self._running = False

    def update_palette(self, lat: float, lon: float) -> Tuple[Tuple[int, int], List[Path]]:
        cell = coord_to_grid(lat, lon, self.grid_size_meters)
        if cell != self._current_cell:
            self._current_cell = cell
            self._current_palette = get_cell_palette(self.audio_files, cell, self.palette_size)
            print(
                f"\n--- [Grid Transition] Cell {cell} ---"
                f"\nActive pool ({len(self._current_palette)} sounds): "
                f"{[p.name for p in self._current_palette]}"
            )
        return cell, self._current_palette

    def tick(self) -> Optional[Path]:
        """Perform a single 2-second cycle: read GPS, pick audio, play audio."""
        loc = self.location_provider.get_location()

        if loc is None:
            print("[Waiting for GPS fix... playing fallback random sound]")
            candidate_pool = self.audio_files
            current_cell_str = "Acquiring..."
            lat_str, lon_str = "N/A", "N/A"
        else:
            lat = loc["latitude"]
            lon = loc["longitude"]
            cell, candidate_pool = self.update_palette(lat, lon)
            current_cell_str = f"({cell[0]}, {cell[1]})"
            accuracy = loc.get("horizontal_accuracy", 0.0)
            lat_str = f"{lat:.6f}"
            lon_str = f"{lon:.6f} (±{accuracy:.1f}m)"

        if not candidate_pool:
            return None

        selected_file = random.choice(candidate_pool)
        print(f"[GPS: {lat_str}, {lon_str}] Cell: {current_cell_str} -> Playing: {selected_file.name}")
        self.audio_player.play(selected_file, volume=self.volume)
        return selected_file

    def run(self, max_ticks: Optional[int] = None) -> None:
        """Run the playback loop every `self.interval` seconds."""
        print(f"Starting GPS Music Player...")
        print(f"Directory: {self.audio_dir.resolve()} ({len(self.audio_files)} files)")
        print(f"Interval: {self.interval}s ¦ Grid Cell: {self.grid_size_meters}m ¦ Palette Size: {self.palette_size}")
        print("Press Ctrl+C or Stop to exit.\n")

        self.location_provider.start()
        self._running = True
        tick_count = 0

        try:
            next_tick = time.monotonic()
            while self._running:
                self.tick()
                tick_count += 1
                if max_ticks is not None and tick_count >= max_ticks:
                    break

                next_tick += self.interval
                sleep_duration = next_tick - time.monotonic()
                if sleep_duration > 0:
                    time.sleep(sleep_duration)
                else:
                    # System fell behind, reset baseline
                    next_tick = time.monotonic()
        except KeyboardInterrupt:
            print("\nPlayback interrupted by user.")
        finally:
            self.stop()

    def stop(self) -> None:
        """Cleanup location updates and audio players."""
        self._running = False
        print("Stopping location updates and cleaning up audio...")
        try:
            self.location_provider.stop()
        except Exception as e:
            print(f"Error stopping location service: {e}", file=sys.stderr)

        try:
            self.audio_player.stop_all()
        except Exception as e:
            print(f"Error stopping audio players: {e}", file=sys.stderr)
        print("GPS Music Player exited cleanly.")


def parse_args(argv: Optional[Sequence[str]] = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Pythonista 3 GPS-based ambient audio player."
    )
    parser.add_argument(
        "--dir",
        "-d",
        default=DEFAULT_AUDIO_DIR,
        help=f"Directory containing .aif files (default: {DEFAULT_AUDIO_DIR})",
    )
    parser.add_argument(
        "--interval",
        "-i",
        type=float,
        default=DEFAULT_INTERVAL,
        help=f"Interval in seconds between sound plays (default: {DEFAULT_INTERVAL})",
    )
    parser.add_argument(
        "--grid-size",
        "-g",
        type=float,
        default=DEFAULT_GRID_SIZE_METERS,
        help=f"Grid size in meters per coordinate cell (default: {DEFAULT_GRID_SIZE_METERS})",
    )
    parser.add_argument(
        "--palette-size",
        "-p",
        type=int,
        default=DEFAULT_PALETTE_SIZE,
        help=f"Active audio palette size per cell (default: {DEFAULT_PALETTE_SIZE})",
    )
    parser.add_argument(
        "--volume",
        "-v",
        type=float,
        default=DEFAULT_VOLUME,
        help=f"Playback volume between 0.0 and 1.0 (default: {DEFAULT_VOLUME})",
    )
    parser.add_argument(
        "--simulate-gps",
        action="store_true",
        help="Force simulated GPS movement even if native location is available",
    )
    parser.add_argument(
        "--player",
        choices=["auto", "avplayer", "sound", "desktop"],
        default="auto",
        help="Audio player backend: 'auto' (AVAudioPlayer > sound > desktop), 'avplayer', 'sound', or 'desktop' (default: auto)",
    )
    parser.add_argument(
        "--max-ticks",
        type=int,
        default=None,
        help="Optional maximum number of iterations before automatic exit",
    )
    return parser.parse_args(argv)


def main() -> None:
    args = parse_args()
    loc_provider = SimulatedLocationProvider() if args.simulate_gps else None

    app = GPSMusicApp(
        audio_dir=args.dir,
        interval=args.interval,
        grid_size_meters=args.grid_size,
        palette_size=args.palette_size,
        volume=args.volume,
        location_provider=loc_provider,
        audio_backend=args.player,
    )
    app.run(max_ticks=args.max_ticks)


if __name__ == "__main__":
    main()

```
