# Dotfiles

## Overview

This repository contains my personal dotfiles and is designed to automate the setup of a macOS system to my preferred configuration. While the primary goal is personal use, the repository is publicly available for anyone to learn from or use.

## Supported Platforms

- **macOS**: Fully supported.
- **Linux**: Partially supported.

## Dependencies
Only `Make` and `Git` is needed.

## Installation

To get started, clone the repository and execute the following commands:

```bash
./install.sh
```

## Usage

After installation, you can use `make deploy` to refresh the configuration. This will create symbolic links to the appropriate configuration files.

## Configuration Files and Directories

This repository contains settings and configurations for a variety of tools and environments. Below is a breakdown:

- **Brewfile & Brewfile.lock.json**: Homebrew package definitions.
- **Dockerfile & Dockerfile.nightly**: Docker configurations for standard and nightly builds.
- **Makefile**: Make tasks for automating setup and deployment.
- **Ansible**: Contains Ansible playbooks and roles for different setups like `apt-packages`, `docker`, `fish`, `neovim`, `nodenv`, and `rbenv`.
- **dotfilesLink.bat & dotfilesLink.ps**: Batch and PowerShell scripts for creating symbolic links in Windows.
- **install.sh**: Shell script to initialize the environment.
- **installers**: Contains various shell scripts for setting up specific tools and utilities.
- **rc**: The core directory containing configurations for:
  - `bash` (bash_profile, bashrc)
  - `fish` (config.fish, fishfile, and custom functions)
  - `git` (gitconfig)
  - `vim` (gvimrc, tmux.conf, vimrc, and more)
  - `tmux` (tmux.conf)
- **test**: Contains testing scripts.

## Contributing

This repository is not currently accepting contributions, but feel free to use it for your own purposes.

## License

Feel free to use this repository however you like.
