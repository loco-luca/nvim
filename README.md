# Neovim Config and Setup Script

This repository contains my Neovim configuration and a setup script to quickly install dependencies and set up the config on any machine.

---

## Contents

- `init.lua` and Lua config files for Neovim plugins and settings.
- `setup_dotfiles.sh` — Bash script to:
  - Install system dependencies (Linux, macOS, Arch Linux supported).
  - Clone this repo to `~/dotfiles`.
  - Create the necessary symlink for Neovim config (`~/.config/nvim`).
  - Install the Rust language server (`rust-analyzer`).
  - Launch Neovim in headless mode to sync plugins.

## undercontruction 

<!-- ## Usage -->
<!---->
<!-- 1. Clone this repo manually or via the script: -->
<!---->
<!-- ```bash -->
<!-- git clone https://github.com/loco-luca/nvim.git ~/dotfiles -->
<!---->
<!-- # 2. Run the setup script to install dependencies and set up config: -->
<!-- # bash ~/dotfiles/nvim/setup_dotfiles.sh -->
<!-- # -->
<!-- # 3. Launch Neovim: -->
<!-- # nvim -->
