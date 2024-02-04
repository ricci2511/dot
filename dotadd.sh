#!/bin/bash

# TODO: Document this script and mention in README

DOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# The first argument is the path to the dotfile being added and symlinked
# Example: `./dotadd.sh ~/.zshrc` -> Creates and symlinks $DOT_DIR/.zshrc to $HOME/.zshrc
# Example: `./dotadd.sh ~/.config/app/cool.conf` -> Creates and Symlinks $DOT_DIR/.config/app/cool.conf to $HOME/.config/app/cool.conf
TARGET_PATH="$1"

# The relative path of the new dotfile to add relative to the dotfiles directory
# Example: $DOT_DIR/.zshrc
RELATIVE_PATH="$DOT_DIR/${TARGET_PATH#$HOME}"

# Open editor of choice, in my case nvim
nvim $RELATIVE_PATH

exit_if_symlink() {
	if [[ -L $1 ]]; then
		exit 0
	fi
}

# Handle files destined for .config directory
if [[ $RELATIVE_PATH == *".config"* ]]; then
	DIR_NAME=$(dirname $RELATIVE_PATH)
	FILE_NAME=$(basename $RELATIVE_PATH)

	# Remove the .config/ prefix, so we can create the symlink in the correct place
	DIR_NAME=${DIR_NAME#"$DOT_DIR/.config/"}

	# If DIR_NAME still contains .config, a file is being added, otherwise a directory
	if [[ $DIR_NAME == *".config"* ]]; then
		exit_if_symlink $HOME/.config/$FILE_NAME

		ln -s $DOT_DIR/.config/$FILE_NAME $HOME/.config/$FILE_NAME
		echo "Symlinked $DOT_DIR/.config/$FILE_NAME to $HOME/.config/$FILE_NAME"
	else
		exit_if_symlink $HOME/.config/$DIR_NAME

		ln -s $DOT_DIR/.config/$DIR_NAME $HOME/.config
		echo "Symlinked $DOT_DIR/.config/$DIR_NAME to $HOME/.config"
	fi
else
	exit_if_symlink $TARGET_PATH

	ln -s $RELATIVE_PATH $TARGET_PATH
	echo "Symlinked $RELATIVE_PATH to $TARGET_PATH"
fi
