# ---------------------
# Variable Definitions
# ---------------------

# Find all source files for dotfiles
DOTFILES_SRC := $(shell find rc -type f -print)

# Find all source files for Neovim
NEOVIM_SRC := $(shell find rc/vim -type f -print)

# Directory containing all rc files
RC_DIR := $(realpath rc/)

# Destination paths for dotfiles
DOTFILES := $(patsubst rc/%, ~/.%, $(DOTFILES_SRC))

# Destination path for Neovim's init.vim
NEOVIM_RC := $(HOME)/.config/nvim/init.vim

# Destination paths for other Neovim files
NEOVIM_FILES := $(patsubst rc/vim/%, ~/.config/nvim/%, $(NEOVIM_SRC))

# Find all source files for VSCode
VSCODE_SRC := $(shell find rc/vscode -type f -print)

# VSCode setting root directory
VSCODE_ROOT := ~/Library/Application\ Support/Code/User

# Determine OS type
OS := $(shell uname -s)

# Conditional logic for setting up symlink flags based on OS
ifeq ($(OS), Linux)
	LN_FLAGS=-sfT
else ifeq ($(OS), Darwin)
	LN_FLAGS=-sfh
else
	$(error unknown OS $(OS)))
endif

# ------------------
# Phony Declarations
# ------------------

.PHONY: deploy link_files ansible submodule fzf clean

# ------------
# Main Targets
# ------------

# Main deployment target
deploy: link_files

# Links all files to their appropriate locations
link_files: $(DOTFILES) $(NEOVIM_RC) $(NEOVIM_FILES) $(VSCODE_FILES) $(VSCODE_ROOT)/settings.json

# ---------------------------
# Individual File Link Targets
# ---------------------------

# Linking dotfiles
$(DOTFILES): $(HOME)/.%: $(RC_DIR)/%
	-mkdir -p $(dir $@)
	-ln $(LN_FLAGS)  $< $@

# Linking Neovim init file
$(NEOVIM_RC): $(RC_DIR)/vimrc
	-mkdir -p $(dir $@)
	-ln $(LN_FLAGS)  $< $@

# Linking other Neovim files
$(NEOVIM_FILES): $(HOME)/.config/nvim/%: $(RC_DIR)/vim/%
	-mkdir -p $(dir $@)
	-ln $(LN_FLAGS)  $< $@

# Lining VSCode settings.json
$(VSCODE_ROOT)/settings.json: $(RC_DIR)/vscode/settings.json
	-mkdir -p $(dir $@)
	-ln $(LN_FLAGS)  "$<" "$@"

# ---------------
# Utility Targets
# ---------------

# Run Ansible playbook
ansible: submodule
	ansible-playbook -i localhost, -c local ansible/site.yml

# Update all git submodules
submodule:
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

# Install or update Homebrew and packages
brew:
	@if ! command -v brew > /dev/null; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"; fi
	brew bundle

# Install or update fzf
fzf:
	bash installers/fzf.sh

clean:
	-for file in $(DOTFILES) $(NEOVIM_RC) $(NEOVIM_FILES) $(VSCODE_FILES) $(VSCODE_ROOT)/settings.json; do \
		unlink "$$file" || true; \
	done