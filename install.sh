#!/bin/bash

# Function to prompt for overwriting a config file
prompt_overwrite() {
	read -r -p "Config for $1 already exists. Overwrite? [y/N] " response
	case "$response" in
	[yY])
		return 0 # Overwrite
		;;
	*)
		return 1 # Skip
		;;
	esac
}

# Function to check and install Homebrew on macOS
install_homebrew() {
	if ! command -v brew &>/dev/null; then
		echo "Homebrew not found. Installing..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	else
		echo "Homebrew is already installed."
	fi
}

# List of common dependencies between pacman and brew
dependencies="neovim tmux lazygit ripgrep fd starship"

# Appends brew specific package names to dependencies
add_macos_dependencies() {
	dependencies+=" font-fira-code-nerd-font"
}

# Appends pacman specific package names to dependencies
add_arch_dependencies() {
	dependencies+=" ttf-fira-code-nerd-fonts"
}

install_dependencies() {
	local install_prefix=""

	if [ "$(uname)" == "Darwin" ]; then
		install_homebrew
		install_prefix="brew install -q"
		add_macos_dependencies
	elif [ -f /etc/arch-release ]; then
		install_prefix="sudo pacman -S"
		add_arch_dependencies
	else
		echo "Skipping dependencies installation, only supported on macOS and Arch Linux"
		return
	fi

	eval "$install_prefix $dependencies"
}

copy_configs() {
	local item=$1
	local target=$2

	if [ -e "$target/$item" ]; then
		if [ "$force_yes" = true ]; then
			overwrite=0
		else
			prompt_overwrite "$item"
			overwrite=$?
		fi
		if [ "$overwrite" -eq 0 ]; then
			echo "Overwriting $item config..."
			cp -r "$item" "$target"
		else
			echo "Skipping $item config..."
		fi
	else
		echo "Installing $item config..."
		cp -r "$item" "$target"
	fi
}

# Function to install config files and its dependencies
install_dotfiles() {
	install_dependencies

	cd home
	for item in $(ls -A); do
		if [ -d "$item" ] && [ "$item" == "config" ]; then
			# Everything at config dir goes to ~/.config
			cd "$item"
			for config_item in $(ls -A); do
				copy_configs "$config_item" "$HOME/.config/"
			done
			cd ..
		elif [ -f "$item" ]; then
			# Files at root go to ~/
			copy_configs "$item" "$HOME"
		fi
	done

	echo "Done!"
}

# Check for -y flag to skip y/N prompts
force_yes=false
while getopts "y" opt; do
	case ${opt} in
	y)
		force_yes=true
		;;
	\?)
		echo "Invalid option: -$OPTARG" >&2
		exit 1
		;;
	esac
done

install_dotfiles
