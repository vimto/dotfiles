#!/bin/bash

# Get current dir (so run this script from anywhere)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink config dotfiles
ln -sfv "$DOTFILES_DIR/system/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/system/.inputrc" ~

ln -sfv "$DOTFILES_DIR/git/.gitignore" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~

# Run OSX Customisation scripts
for DEFAULTS_FILE in "$DOTFILES_DIR"/osx/*.sh; do
  echo "Applying $DEFAULTS_FILE" && . "$DEFAULTS_FILE"
done

# Run .bash_profile
. ~/.bash_profile
