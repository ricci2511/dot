#!/bin/bash

create_symlink() {
	local source=$1
	local target=$2
	local item=$(basename "$source")

	if [ -e "$target" ] || [ -L "$target" ]; then
		if [ -d "$source" ]; then
			echo "Replacing existing $target/$item directory with symlink..."
			rm -rf "$target/$item"
		else
			if [ -f "$target" ]; then
				echo "Overwriting existing $target file with symlink..."
			else
				echo "Overwriting existing $target/$item file with symlink..."
			fi
		fi

		ln -sf "$source" "$target"
	else
		echo "Creating symlink: $target/$item..."
		ln -s "$source" "$target"
	fi
}

# Symlinks all dotfiles to proper location
install_dotfiles() {
	local exclude_pattern="^(LICENSE|\.git|\.gitignore|\.DS_Store|.*\.txt|.*\.sh|.*\.md)$"

	ls -A | grep -Ev "$exclude_pattern" | while IFS= read -r item; do
		if [ -d "$item" ] && [ "$item" == ".config" ]; then
			# Everything in .config is symlinked to ~/.config
			cd $item
			for config_item in $(ls -A); do
				create_symlink "$PWD/$config_item" "$HOME/.config"
			done
			cd ..
		elif [ -f "$item" ]; then
			# Files at root are symlinked to ~/
			create_symlink "$PWD/$item" "$HOME/$item"
		fi
	done

	echo "Done!"
}

force_yes=false # -y flag to skip warning prompt

while :; do
	case "$1" in
	-y)
		force_yes=true
		shift
		;;
	-*)
		echo "Unknown option: $1"
		exit 1
		;;
	*)
		break
		;;
	esac
done

if [ "$force_yes" = false ]; then
	read -r -p "This may overwrite existing config files. Continue? [y/N] " response
	case "$response" in
	[yY])
		install_dotfiles
		;;
	*)
		echo "Aborted."
		;;
	esac
else
	install_dotfiles
fi
