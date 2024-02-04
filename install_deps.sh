#!/bin/bash

install_homebrew() {
	if ! command -v brew &>/dev/null; then
		echo "Homebrew not found. Installing..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	else
		echo "Homebrew is already installed."
	fi
}

# Check OS and install dependencies for the respective OS
if [ "$(uname)" == "Darwin" ]; then
	install_homebrew
	xargs brew install <packages_brew.txt
elif [ -f /etc/arch-release ]; then
	sudo pacman -S - <packages_pacman.txt
else
	echo "Dependencies cannot be installed, only supported on macOS and Arch Linux"
fi
