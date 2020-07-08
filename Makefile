DOTFILES_SRC := $(shell find rc -type f -print)
RC_DIR := $(realpath rc/)
DOTFILES := $(patsubst rc/%, ~/.%, $(DOTFILES_SRC))
NEOVIM_RC := $(HOME)/.config/nvim/init.vim
OS := $(shell uname -s)

ifeq ($(OS), Linux)
	LN_FLAGS="-sfT"
else ifeq ($(OS), Darwin)
	LN_FLAGS="-sfh"
else
	$(error unknown OS $(OS)))
endif

.PHONY: deploy link_files ansible submodule fzf

$(warning $(OS))
$(warning $(LN_FLAGS))

deploy: link_files

link_files: $(DOTFILES) $(NEOVIM_RC)

$(DOTFILES): $(HOME)/.%: $(RC_DIR)/%
	-mkdir -p $(dir $@)
	-ln $(LN_FLAGS)  $< $@

$(NEOVIM_RC): $(RC_DIR)/vimrc
	-mkdir -p $(dir $@)
	-ln $(LN_FLAGS)  $< $@

ansible: submodule
	ansible-playbook -i localhost, -c local ansible/site.yml

submodule:
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

brew:
	@if ! command -v brew > /dev/null; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"; fi
	brew bundle

fzf:
	bash installers/fzf.sh
