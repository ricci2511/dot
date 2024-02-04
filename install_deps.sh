#!/bin/bash

install_homebrew() {
	if ! command -v brew &>/dev/null; then
		echo "Homebrew not found. Installing..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	else
		echo "Homebrew is already installed."
	fi
}

install_pacman_packages() {
	sudo pacman -S - <packages_pacman.txt
}

install_brew_packages() {
	while IFS= read -r package; do
		brew install "$package"
	done <packages_brew.txt
}

# Check OS and install dependencies for the respective OS
if [ "$(uname)" == "Darwin" ]; then
	install_homebrew
	install_brew_packages
elif [ -f /etc/arch-release ]; then
	install_pacman_packages
else
	echo "Dependencies cannot be installed, only supported on macOS and Arch Linux"
fi
