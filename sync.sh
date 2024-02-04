#!/bin/bash

# This script simply checks if the local dot repo is up to date, if not, it pulls the changes and runs the install script.

if [ $(git rev-list HEAD..origin/main --count) -gt 0 ]; then
	echo "Pulling changes"
	git pull
	echo "Running install.sh"
	./install.sh
else
	echo "Everything is up to date."
	exit 0
fi
