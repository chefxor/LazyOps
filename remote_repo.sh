#!/bin/bash
# Author - Chef
# Github - https://github.com/chefxor

set -e  # Exit on error

# Get GitHub username from Git config
GITHUB_USER=$(git config user.username)

# Get current folder name
FOLDER_NAME=$(basename "$PWD")

# Ensure GitHub username is set
if [[ -z "$GITHUB_USER" ]]; then
    echo "GitHub username not found in Git config. Set it using:"
    echo "git config --global user.username \"your_username\""
    exit 1
fi

# Add remote and push
echo "Setting up Git remote..."
git remote add origin git@github.com:$GITHUB_USER/$FOLDER_NAME.git
git branch -M main
git push -u origin main

echo "Git repository successfully linked to GitHub: $GITHUB_USER/$FOLDER_NAME"

