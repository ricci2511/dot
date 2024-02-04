#!/bin/bash

git pull origin main

if [ $? -eq 0 ]; then
	exit 0
fi

./install.sh -y
