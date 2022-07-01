#!/bin/env bash

## System Configuration / Apply Changes    
sudo usermod -a -G video $(whoami)    
sudo chsh -s/bin/zsh $(whoami)    
mkdir -p ~/.fonts && mkdir -p /home/$(whoami)/.config   
ln -sf /home/$(whoami)/.config /home/$(whoami)/config
