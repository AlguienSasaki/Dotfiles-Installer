#!/bin/env bash

ubuntu2204(){

  ## External Repositories
  sudo apt -y install software-properties-common && sudo add-apt-repository --yes ppa:mmstick76/alacritty && sudo add-apt-repository --yes ppa:libreoffice && sudo apt update &&

  # Dependencies
  sudo apt --yes install dunst build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev imagemagick meson ninja-build wget curl

  ## Installing the packages
  sudo apt -y install git feh bspwm sxhkd neovim mpd ncmpcpp alacritty chromium-browser ranger rofi gnome-screenshot polybar evince

  ####### Building the rest of the sotware   #######

  ## i3lock-color
  git clone https://github.com/Raymo111/i3lock-color.git && cd i3lock-color && ./build.sh && ./install-i3lock-color.sh && cd -

  ## Picom by Jonaburg
  git clone https://github.com/jonaburg/picom && cd picom && meson --buildtype=release . build && ninja -C build && sudo ninja -C build install && cd -

  ## GreenClip
  wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && sudo cp greenclip /usr/bin && sudo chmod +x /usr/bin/greenclip && cd -

  ## BetterLockScreen
  wget https://github.com/pavanjadhaw/betterlockscreen/archive/refs/heads/main.zip && unzip main.zip && cd betterlockscreen-main && chmod u+x betterlockscreen && sudo cp betterlockscreen /usr/local/bin && sudo cp system/betterlockscreen@.service /usr/lib/systemd/system && systemctl enable betterlockscreen@$USER && cd -

}
