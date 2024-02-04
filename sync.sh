#!/bin/bash

git fetch origin main

if [ "$(git rev-list HEAD..origin/main --count)" -gt 0 ]; then
	git pull
	./install.sh -y
else
	echo "Dotfiles are already up to date."
fi
