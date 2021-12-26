#!/usr/bin/env fish

# Use stow from main dotfiles in future
mkdir -p ~/.config/nvim
ln -s (pwd)/* ~/.config/nvim
