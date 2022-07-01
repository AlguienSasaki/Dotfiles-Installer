#!/bin/env bash

archbtw(){

  ## Installing dependencies
  sudo pacman -S git unzip nodejs bluez bluez-plugins bluez-tools bluez-utils alsa-utils pamixer mpc wget curl base-devel cmake meson ninja python-pip light --noconfirm

  sudo pacman -S frei0r-plugins gst-libav gst-plugins-ugly texlive-bin texlive-latexextra python-certifi --noconfirm

  ## Installing the packages
  sudo pacman -S feh bspwm sxhkd polybar neovim mpd ncmpcpp alacritty firefox ranger rofi gnome-screenshot evince dunst --noconfirm

  ## Installing AUR package manager
  git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd -

  ####### Installing the AUR sotware   #######
  yay -S betterlockscreen picom-jonaburg-git rofi-greenclip mpd-notification cava adobe-source-han-sans-jp-fonts nordzy-icon-theme-git --noconfirm

}
