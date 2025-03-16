#!/bin/bash
cd "$(dirname "$0")"

# Stow all directories inside the dotfiles repo
for dir in */; do
    stow -t ~ "$dir"
done

echo "All dotfiles have been symlinked."
