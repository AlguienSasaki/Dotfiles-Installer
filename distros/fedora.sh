#!/bin/env bash

fedora(){

  ## Dependencies
  sudo dnf -y install git wget curl mpc light cmake make automake gcc gcc-c++ kernel-devel ninja-build meson

  ## Installing the packages
  sudo dnf -y install bspwm sxhkd polybar chromium mpd ncmpcpp neovim alacritty ranger gnome-screenshot evince dunst

}
