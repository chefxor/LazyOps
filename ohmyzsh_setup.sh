#!/bin/bash

set -e  # Exit on error

# Install dependencies
echo "Installing dependencies..."
sudo apt update && sudo apt install -y zsh git curl wget

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set Zsh as the default shell
echo "Setting Zsh as default shell..."
chsh -s $(which zsh)

## Install plugins
echo "Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete

echo "Updating .zshrc to enable plugins..."
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete)/' ~/.zshrc

# Apply changes
echo "Reloading Zsh configuration..."
source ~/.zshrc

echo "Oh My Zsh installation complete! Restart your terminal or run 'zsh' to start using it."

