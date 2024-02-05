# dot

This repository contains my personal dotfiles and configurations for various tools and applications.

It also serves as a flexible template for managing dotfiles using symlinks and straightforward shell scripts.

## Usage

1. Clone the Repository and Navigate to it:

   ```shell
   git clone https://github.com/ricci2511/dot.git && cd dot
   ```

2. Review and Customize Dotfiles:

   - **.config Directory:**
     Add configuration files for software following the XDG Base Directory Specification (e.g., `nvim`, `tmux`) into the `.config` directory. These will be symlinked to `~/.config/`.
   - **Root-Level Configurations:**
     For files that belong in the root of the home directory (e.g., `.bashrc`, `.zshrc`), place them in the root of the repository. These will be symlinked to `~`.

3. **Run the Install Script:**
   Run the script to symlink dotfiles. Be cautious, as existing dotfiles will be overwritten:

   ```shell
   # Use the -y flag to skip overwrite warnings
   ./install.sh
   ```

## Additional Components

#### `install_packages.sh`

This script installs the software packages associated with my dotfiles using brew and pacman package managers. Package names are derived from `packages_pacman.txt` and `packages_brew.txt` files. While it primarily supports my setup, you can easily adapt it to your needs. Add your desired package names to a text file and make slight modifications to the script for your preferred package manager.

#### `sync.sh`

This script pulls the latest changes from the repository and runs the install script if new changes are available.
