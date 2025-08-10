 #!/usr/bin/env bash
set -e

echo "=== Cloning or Updating dotfiles repo ==="
if [ -d ~/dotfiles ]; then
  echo "Directory ~/dotfiles already exists, pulling latest changes..."
  cd ~/dotfiles
  git pull
else
  git clone https://github.com/loco-luca/nvim.git ~/dotfiles
fi

echo "=== Creating symlink for Neovim config ==="
mkdir -p ~/.config
ln -sf ~/dotfiles/nvim ~/.config/nvim
echo "Symlink created: ~/.config/nvim -> ~/dotfiles/nvim"

OS="$(uname -s)"

install_linux() {
    echo "=== Installing system dependencies on Linux ==="
    sudo apt update
    sudo apt install -y neovim nodejs npm python3 python3-pip ripgrep fzf git clangd lua-language-server dart-sdk
}

install_macos() {
    echo "=== Installing system dependencies on macOS ==="
    if ! command -v brew >/dev/null; then
        echo "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install neovim node npm python3 ripgrep fzf git llvm lua-language-server rust tree-sitter stylua lua clang-format black dart-sdk
}

install_arch() {
    echo "=== Installing system dependencies on Arch Linux ==="
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm neovim nodejs npm python python-pip ripgrep fzf git clang lua-language-server dart-sdk
}

echo "=== Detecting OS ==="
if [ -f /etc/arch-release ]; then
    install_arch
else
    case "$OS" in
        Linux*) install_linux ;;
        Darwin*) install_macos ;;
        *) echo "Unsupported OS: $OS" && exit 1 ;;
    esac
fi

echo "=== Installing Rust language server ==="
if ! command -v rust-analyzer >/dev/null; then
    if command -v cargo >/dev/null; then
        cargo install rust-analyzer
    else
        echo "Rust not installed. Installing rustup..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        cargo install rust-analyzer
    fi
fi

echo "=== Launching Neovim to install plugins ==="
nvim --headless "+Lazy! sync" +qa

echo "✅ Setup complete! Neovim is ready."
