---
layout: post
title: "MacOS Catalina uses zsh by default, if you are using the same you want to add the line to ~/.zshrc"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Sep 29, 2020. rbenv in catalina: [MacOS Catalina uses zsh by default, if you are using the same you want to add the line to ~/.zshrc](https://stackoverflow.com/questions/58790425/why-rbenv-does-not-work-on-mac-os-catalina) "the line" is:
```sh
eval "$(rbenv init -)"
```
As of this writing, stable ruby is 2.7.1, here's [how to install ruby 2.7.1 using homebrew](https://stackoverflow.com/questions/36485180/how-to-update-ruby-with-homebrew):
```sh
brew update
brew install ruby-build
brew install rbenv
rbenv install 2.7.1
rbenv global 2.7.1
```
