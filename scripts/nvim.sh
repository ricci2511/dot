#!/usr/bin/env bash

echo "### Neovim nightly script ###"
echo "Don't forget to install necessary deps from dot/packages!"

NEOVIM_DIR="$HOME/neovim"

# Check if Neovim directory already exists
if [ -d "$NEOVIM_DIR" ]; then
  read -p "Update Neovim? (y/n): " update_choice
  case "$update_choice" in
  [Yy]*)
    cd "$NEOVIM_DIR"
    git pull origin master
    ;;
  *)
    echo "Skipping Neovim update."
    exit 0
    ;;
  esac
else
  git clone https://github.com/neovim/neovim "$NEOVIM_DIR"
  cd "$NEOVIM_DIR"
fi

# Compile and install Neovim nightly
make CMAKE_BUILD_TYPE=Release
sudo make install
