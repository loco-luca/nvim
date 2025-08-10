#!/usr/bin/env bash
set -e

echo "Cloning dotfiles repo..."
if [ -d ~/dotfiles ]; then
  echo "Directory ~/dotfiles already exists, pulling latest changes..."
  cd ~/dotfiles
  git pull
else
  git clone https://github.com/loco-luca/nvim.git ~/dotfiles
fi

echo "Creating symlink for Neovim config..."
mkdir -p ~/.config
ln -sf ~/dotfiles/nvim ~/.config/nvim

echo "Setup complete!"
