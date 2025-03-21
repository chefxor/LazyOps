#!/bin/bash

# Initial update & upgrade
sudo pacman -Syyu

# Installation of yay AUR handler
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Installation of neccessary packages
sudo pacman -S alacritty awesome rofi picom network-manager-applet ufw zsh neovim tmux kitty emacs fish stow xorg-xinit xclip flameshot tree lf nitrogen lxappearance pcmanfm ripgrep pass terminator rofi

# Installing fonts
yay -S ttf-hack-nerd ttf-firacode-nerd ttf-iosevkaterm-nerd ttf-mononoki-nerd ttf-terminus-nerd

# Setting up neovim
sh ~/LazyOps/nvim_setup.sh

# Setting up firwall
sh ~/LazyOps/firewall_setup.sh
