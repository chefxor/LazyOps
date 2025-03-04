#!/bin/bash

# Cloning the dotfiles as a bare repo
git clone --bare git@github.com:chefxor/dotfiles.git $HOME/dotfiles

# Define the alias for managing dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

# Ensure the working tree is clean before checkout
mkdir -p $HOME/.config-backup  # Backup existing dotfiles if needed
dotfiles checkout 2>/dev/null || {
    echo "Backing up pre-existing dotfiles..."
    dotfiles checkout 2>&1 | grep -E "^\s+." | awk '{print $1}' | while read file; do
        mv "$HOME/$file" "$HOME/.config-backup/"
    done
    dotfiles checkout
}

# Set Git to not show untracked files
dotfiles config --local status.showUntrackedFiles no

echo "Dotfiles successfully set up."