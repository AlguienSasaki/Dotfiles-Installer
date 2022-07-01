#!/bin/env bash

compile(){

  ####### Building the rest of the sotware   #######

  ## i3lock-color
  git clone https://github.com/Raymo111/i3lock-color.git && cd i3lock-color && ./build.sh && ./install-i3lock-color.sh && cd -

  ## Polybar
  git clone --recursive https://github.com/polybar/polybar && cd polybar && ./build.sh && cd -

  ## Picom by Jonaburg
  git clone https://github.com/jonaburg/picom && cd picom && meson --buildtype=release . build && ninja -C build && sudo ninja -C build install && cd -

  ## GreenClip
  wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip && sudo cp greenclip /usr/bin && sudo chmod +x /usr/bin/greenclip && cd -

  ## BetterLockScreen
  wget https://github.com/pavanjadhaw/betterlockscreen/archive/refs/heads/main.zip && unzip main.zip && cd betterlockscreen-main && chmod u+x betterlockscreen && sudo cp betterlockscreen /usr/local/bin && sudo cp system/betterlockscreen@.service /usr/lib/systemd/system && systemctl enable betterlockscreen@$USER && cd -

}
