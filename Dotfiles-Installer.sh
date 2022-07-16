#!/bin/env bash

source ./distros/archbtw.sh
source ./distros/ubuntu2004.sh
source ./distros/ubuntu2204.sh
source ./distros/gentoo.sh
source ./distros/suse.sh
source ./distros/debian.sh
source ./distros/bsd.sh

## mkdir -p ~/Pictures/Wallpapers && wget https://download1338.mediafire.com/dx97kbxefskg/t0ix8efdnvgh8q5/Lite.zip && unzip Lite.zip && cp -rf Lite/* ~/Pictures/Wallpapers
## mkdir -p ~/Pictures && wget https://www.mediafire.com/file/9phovsyxankf7og/Wallpapers.zip/file && unzip Wallpapers.zip && mv -f Wallpapers ~/Pictures 

process(){
  
  fntsrc="wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/"

  ## System Configuration / Apply Changes 
  sudo usermod -a -G video $(whoami) 
  sudo chsh -s/bin/zsh $(whoami) 
  mkdir -p ~/.fonts && mkdir -p /home/$(whoami)/.config
  ln -sf /home/$(whoami)/.config /home/$(whoami)/config
  mkdir -p ~/.themes && mkdir ~/.icons

  ## Installing Dotfiles
  sudo pip3 install ueberzug

  ## Installing Dotfiles
  git clone https://github.com/AlguienSasaki/Dotfiles && cp -rf Dotfiles/config/* ~/.config
  
  ## Installing Fonts
  $fntsrc/DejaVuSansMono.zip && $fntsrc/Hack.zip && $fntsrc/Ubuntu.zip && $fntsrc/JetBrainsMono.zip && $fntsrc/Iosevka.zip && unzip DejaVuSansMono.zip && unzip Hack.zip && unzip Ubuntu.zip && unzip JetBrainsMono.zip && unzip Iosevka.zip && mv *.ttf ~/.fonts && mv *.otf ~/.fonts

  ## Installing weird Fonts
  cp -rf ./fonts/* ~/.fonts

  ## Systemd-services
  sudo cp systemd-services/greenclip.service /usr/lib/systemd/user/ && systemctl --user enable greenclip.service && systemctl --user start greenclip.service && cd -

  ## Installing Oh My Zsh
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

  ## Installing Zsh alias
  cat ~/.config/alias >> ~/.zshrc
  
  ## Change git default text editor
  git config --global core.editor "nvim"

  ## Installing Vim Plug
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  ## Install ncmpcpp-uebezurg
  
  cd config/ncmpcpp && git clone https://github.com/alnj/ncmpcpp-ueberzug.git && chmod +x ncmpcpp-ueberzug ncmpcpp_cover_art.sh && cd -
  sudo ln -s ~/config/ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug /usr/bin

  ## Install Firefox theme 

  git clone https://github.com/datguypiko/Firefox-Mod-Blur && cp -rf Firefox-Mod-Blur/* ~/.mozilla/firefox/*default*/chrome && cp ~/.mozilla/firefox/*default*/chrome/userChrome-NoBlur-MacOsStyleButtonsLeftSide.css ~/.mozilla/firefox/*default*/chrome/userChrome.css

  ## Install icon themes 

  # Big Sur
  git clone https://github.com/yeyushengfan258/BigSur-icon-theme && bash BigSur-icon-theme/install.sh -a

  # Candy
  mkdir -p ~/.icons/candy-icons && git clone https://github.com/EliverLara/candy-icons ~/.themes/candy-icons

  #Catppuccin
  git clone https://github.com/catppuccin/gtk && bash gtk/scripts/install.sh -t teal
  
  #Catppuccin
  git clone https://github.com/vinceliuice/Tela-icon-theme && bash Tela-icon-theme/install.sh -c pink green red blue

  # Gruvbox 
  git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme && cp -rf Gruvbox-GTK-Theme/icons/* ~/.icons/ && cp -rf Gruvbox-GTK-Theme/themes/* ~/.themes

  # Tela colors
  git clone https://github.com/vinceliuice/Tela-icon-theme && bash Tela-icon-theme/install.sh -c pink green red blue

  ## Install GTK themes

  # Midnight
  git clone https://github.com/i-mint/midnight && cp -rf midnight/Midnight* ~/.themes 

  # Marwaita Endeavour Os
  git clone https://github.com/darkomarko42/Marwaita-EndeavourOs && cp -rf Marwaita-EndeavourOs/Marwa* ~/.themes

  # Nordic
  mkdir -p ~/.themes/Nordic-standard-buttons-v40 && git clone --branch standard-buttons https://github.com/EliverLara/Nordic  ~/.themes/Nordic-standard-buttons-v40

  # Cloudy
  git clone https://github.com/i-mint/Cloudy && cp -rf Cloudy/Cloudy* ~/.themes
  
  # Sweet
  mkdir -p ~/.themes/Sweet-Dark-v40 && git clone --branch nova https://github.com/EliverLara/Sweet ~/.themes/Sweet-Dark-v40

  # Elemento cocoa
  git clone https://github.com/darkomarko42/Elemento-cocoa && cp -rf Elemento-cocoa/Elemento* ~/.themes



}

#___________________________________________________________ Drawing Menu && Apply Changes ____________________________________________________________________

export DIALOGOPTS="--colors --backtitle \"Select Kernel\""
echo "screen_color = (RED,RED,ON)" > /tmp/dialog_err.rc

TEXT="
Choose your Linux Distro to Install My Dotfiles.

Use \Zb\Z3Up/Down\Zn keys to select and \Zb\Z3Return\Zn to proceed."

  # Ask for distro 
  result=$(dialog --stdout --nocancel --title "Select Your Linux Distro" --menu "$TEXT" 0 0 0 1 "ArchLinux" 2 "Based on Ubuntu 20:04" 3 "Based on Ubuntu 22:04" 4 "Fedora" 5 "Suse" 6 "Gentoo" 7 "Free BSD" 8 "Debian")
  case $result in   
    1)
      archbtw && process
      ;;   
    2)   
      ubuntu2004 && process
      ;;
    3)
      ubuntu2204 && process
      ;;
    4)
      fedora && process
      ;;
    5)
      suse 
      ;;
    6)
      gentoo 
      ;;
    7)
      bsd
      ;;
    8)
      debian 
      ;;
esac
