# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview
This is a dotfiles repository that automates development environment setup on macOS and Linux. It uses a two-layer architecture:
- **Install Layer**: Software installation (primarily Homebrew)
- **Setup Layer**: Configuration deployment via symlinks

## Essential Commands

### Installation and Setup
```bash
# Install specific tool
./install [TARGET]

# Setup specific tool configuration
./setup [TARGET]

# Install and setup everything
./install -a && ./setup -a

# List available installers/setups
./install -l
./setup -l
```

### Testing
```bash
# Run end-to-end tests
./tests/e2e.sh
```

### Tool-Specific Commands
Most tools use Makefiles for deployment:
```bash
# Deploy vim configuration
cd setups/vim && make deploy

# Deploy neovim configuration  
cd setups/neovim && make deploy
```

## Architecture Patterns

### Directory Structure
- `installers/`: Installation scripts (e.g., `homebrew.sh`)
- `setups/`: Configuration for each tool
  - Each tool has: `setup.sh`, config files, optional `Makefile`
- `lib/util.sh`: Shared utilities (platform detection, command checks)

### Setup Script Pattern
Each `setups/*/setup.sh` typically:
1. Sources `lib/util.sh` for utilities
2. Checks if tool is installed
3. Runs `make deploy` or creates symlinks manually
4. Handles platform-specific logic

### Makefile Pattern
Most Makefiles follow this structure:
```makefile
DOTFILES_DIR := $(shell git rev-parse --show-toplevel)
TARGETS := list of config files

deploy:
	@for target in $(TARGETS); do \
		ln -sfnv $(DOTFILES_DIR)/setups/TOOL/$$target ~/$$target; \
	done
```

### Platform-Specific Handling
- Use `[[ $OS == "macos" ]]` or `[[ $OS == "linux" ]]` for OS detection
- Homebrew paths differ: `/opt/homebrew` (Apple Silicon) vs `/usr/local` (Intel/Linux)
- Some tools (bash, macOS settings) have platform-specific configurations

## Key Implementation Details

### Neovim Configuration
- Uses both Vimscript (`config/init/`) and Lua (`config/lua/plugins/`)
- Plugin management via vim-plug and lazy.nvim
- Extensive LSP and completion setup in Lua files

### Shell Configuration
- Bash: Sources from `~/.bashrc.d/` for modular configs
- Fish: Uses Fisher for plugin management, custom functions in `config/functions/`

### Git Configuration
- Global gitconfig with user-specific includes
- Supports work-specific configurations via includeIf

### Testing
The e2e test (`tests/e2e.sh`) validates the entire flow using Docker, ensuring idempotency and cross-platform compatibility.