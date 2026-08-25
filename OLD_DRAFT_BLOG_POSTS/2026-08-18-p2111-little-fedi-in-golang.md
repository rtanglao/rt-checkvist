---
layout: post
title: "littleFedi ¦ A small ActivityPub server written in Go"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Aug 19, 2026 04:11 (UTC) [littleFedi ¦ A small ActivityPub server written in Go](https://littlefedi.org/index.html)<-- **QUOTE**: `littleFedi is a small ActivityPub server written in Go. It ships as a single static executable with a server-rendered web interface, a Mastodon-compatible client API, a durable federation queue, moderation tools, and optional PostgreSQL and S3 support. No runtime to install, no services to wire together. ` <-- Sounds great!

## Probably wrong advice from Gemini

### User:
littleone fedi

### Assistant:
**littleFedi** is a lightweight, low-resource ActivityPub and Fediverse server software designed by Stefano Marinelli to run on minimal hardware like a Raspberry Pi Zero W. **littleOne** (`littleone.littlefedi.social`) serves as an early public instance running on this software. 

#### About littleFedi
* **Single Binary Design:** Built in Go without heavy database or worker process dependencies like Redis or Sidekiq.
* **Low Power:** Optimized to run efficiently on single-board computers using very little RAM.
* **Fediverse Compatibility:** Fully speaks ActivityPub and features a Mastodon-compatible client API so standard apps work smoothly.
* **Static Blogging:** Includes features to turn Fediverse posts and their public threaded replies into lightweight static blog pages.

If you want, let me know if you would like to:
* Learn how to **set up or host** a littleFedi instance
* Understand how it **compares to Mastodon or snac**

Let me know how you'd like to proceed.

---

### User:
how to host a littleFedi instance on a raspberry pi behind tailscale

### Assistant:
To host a **littleFedi** instance on a Raspberry Pi behind Tailscale, you must overcome the major hurdle of typical Fediverse hosting: other instances need to reach your server over standard public HTTPS, but Tailscale hides your Pi from the public internet.

To solve this, littleFedi includes a built-in feature called **littleMesh**. This mechanism allows your private instance to securely peer and federate through a public "lighthouse" proxy without needing public DNS records, an open router port, or a public IP address.

Here is how to set up littleFedi on your Pi with Tailscale for private client access while keeping federation active via littleMesh.

---

#### Step 1: Install Tailscale on the Raspberry Pi
You need Tailscale active on your Pi so your phones, laptops, and Mastodon clients can connect to it securely from anywhere.

1. SSH into your Raspberry Pi.
2. Run the official Tailscale installation script:
   ```bash
   curl -fsSL https://tailscale.com ¦ sh
   ```
3. Authenticate and bring the network interface up:
   ```bash
   sudo tailscale up
   ```
4. Copy your Pi's Tailscale IP address for future reference:
   ```bash
   tailscale ip -4
   ```

#### Step 2: Download and Install littleFedi
Because littleFedi compiles down to a single, static Go binary with an embedded SQLite database, installation takes seconds.

1. Download the correct ARM binary for your Raspberry Pi architecture from the official littleFedi release page.
2. Move the binary into your execution path and make it executable:
   ```bash
   sudo mv littlefedi /usr/local/bin/
   sudo chmod +x /usr/local/bin/littlefedi
   ```

#### Step 3: Run the Interactive Setup
littleFedi includes an onboarding tool to configure your instance and automatically request/configure the **littleMesh** federation tunnel.

1. Initialize the setup wizard:
   ```bash
   littlefedi init
   ```
2. When prompted by the interactive command line:
   * Select **Lighthouse / littleMesh** mode when asked about network topology.
   * Provide the network address or choose the embedded SQLite database profile.
   * If running on a low-end Pi (like a Pi Zero), toggle `low_power = true` in the configuration file to optimize database locks and memory caching.

#### Step 4: Configure the Web Interface Listener
To ensure you can log into your instance using a Mastodon mobile app or web browser over your Tailscale network, change the listening interface.

1. Open your generated littleFedi configuration file (usually `config.toml` or similar).
2. Set the `listen` address to explicitly bind to your **Tailscale IP address** (from Step 1) or to all local interfaces:
   ```toml
   listen = "0.0.0.0:8080"
   ```
3. (Optional) If you want a smooth interface without manual port typing, install a lightweight reverse proxy like Caddy on the Pi to map incoming Tailscale traffic on port 80/443 over to your littleFedi port.

#### Step 5: Automate with systemd
Create a background service file so littleFedi automatically boots and recovers when your Pi restarts.

1. Create a service file:
   ```bash
   sudo nano /etc/systemd/system/littlefedi.service
   ```
2. Paste the configuration text below (adjusting paths to match where your config file is stored):
   ```ini
   [Unit]
   Description=littleFedi Server
   After=network.target tailscaled.service

   [Service]
   Type=simple
   User=pi
   WorkingDirectory=/home/pi/littlefedi
   ExecStart=/usr/local/bin/littlefedi --config /home/pi/littlefedi/config.toml
   Restart=always

   [Install]
   WantedBy=multi-user.target
   ```
3. Enable and start the service:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl enable littlefedi
   sudo systemctl start littlefedi
   ```

---

#### Step 6: Connect Your Clients
* **Web UI:** Turn on Tailscale on your laptop, type your Pi's Tailscale IP address (e.g., `http://100.x.y.z:8080`) into your browser, and log in.
* **Mobile Apps:** Use any Mastodon-compatible app (Mona, Ivory, Ice Cubes) while connected to your Tailnet. Enter your localized Tailscale instance URL when the app requests your server domain.

If you are interested, I can:
* Provide the configuration blocks to **set up Caddy as a local HTTPS reverse proxy** using Tailscale's automatic SSL certificates.
* Explain how to **add custom static blog themes** to your littleFedi instance.

Let me know how you want to proceed.

---

### User:
Provide the configuration blocks to set up Caddy as a local HTTPS reverse proxy using Tailscale's automatic SSL certificates.

### Assistant:
To set up Caddy Server as a local reverse proxy with automatic Tailscale HTTPS certificates, you don't need any complex SSL configuration block. Caddy automatically communicates with the local `tailscaled` daemon to request and renew the TLS certificates for any domain ending in `.ts.net`.

#### Step 1: Grant Caddy Access to Tailscale
By default, the `caddy` user cannot access the Tailscale socket file to request certificates. You must tell the Tailscale daemon to allow the `caddy` system user to read its state.

Run this command on your Raspberry Pi:
```bash
sudo tailscale up --operator=caddy
```

#### Step 2: Find Your Tailnet MagicDNS Domain
You need the exact, unique domain string that Tailscale assigned to your Raspberry Pi. Get it by executing:
```bash
tailscale status --peers=false
```
*Look for your device's Full Domain Name (e.g., `raspberrypi.tail1234.ts.net`).*

#### Step 3: Configure the Caddyfile
Open or create your `/etc/caddy/Caddyfile`:
```bash
sudo nano /etc/caddy/Caddyfile
```

Replace the contents with the block below. Make sure to swap out your actual `.ts.net` address and verify the port matches your `littlefedi` instance config (assuming port `8080`):

```caddy
# Replace with your actual device domain from Step 2
raspberrypi.tail1234.ts.net {
    # Route all traffic securely to your local littleFedi instance
    reverse_proxy localhost:8080
    
    # Optional headers to ensure proper Fediverse activity headers pass through
    header {
        X-Forwarded-Proto https
    }
}
```

#### Step 4: Apply and Restart Services
1. Validate your Caddy syntax formatting:
   ```bash
   caddy validate --config /etc/caddy/Caddyfile
   ```
2. Reload the Caddy service configuration to fetch the certificate from Tailscale:
   ```bash
   sudo systemctl reload caddy
   ```

#### Troubleshooting
* **Handshake/Connection Errors:** Ensure you have explicitly enabled **HTTPS Certificates** in your Tailscale Admin Console under the DNS settings menu.
* **Port Conflicts:** Ensure `littlefedi` is listening on a local port like `127.0.0.1:8080` and **not** trying to bind to port `:80` or `:443`, as Caddy needs absolute control over those public-facing web ports.

If you'd like, let me know if you would like to:
* See a **Docker Compose example** managing both containers simultaneously
* Troubleshoot **Caddy logs** if the domain fails to resolve securely

Let me know how you would like to proceed!

---

### User:
so what will the domain name be? is it a tailscale domain or can i use my own doman?

### Assistant:
You can use **either**, but the choice radically changes how your instance connects to the rest of the Fediverse. 

Here is how the domain name works depending on which path you choose:

#### Option 1: Using your Tailscale domain (`.ts.net`)
If you use the Tailscale domain (e.g., `your-pi.tail1234.ts.net`), you get automatic, zero-configuration HTTPS via Caddy. 

* **How you connect:** You type `https://ts.net` into your browser or mobile app.
* **The Catch:** Other public Fediverse servers (like Mastodon or Bluesky bridges) **cannot** see or talk to a `.ts.net` domain because it only exists inside your private Tailscale network. You will be completely isolated unless you utilize littleFedi’s built-in **littleMesh** lighthouse feature to tunnel the traffic out.

#### Option 2: Using your own custom domain (e.g., `://yourname.com`)
You can absolutely use your own custom domain name, which is highly recommended if you want a clean, professional username like `@you@yourname.com`.
