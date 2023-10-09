DOTFILES_SRC := $(shell find rc -type f -print)
NEOVIM_SRC := $(shell find rc/vim -type f -print)
RC_DIR := $(realpath rc/)
DOTFILES := $(patsubst rc/%, ~/.%, $(DOTFILES_SRC))
NEOVIM_RC := $(HOME)/.config/nvim/init.vim
NEOVIM_FILES := $(patsubst rc/vim/%, ~/.config/nvim/%, $(NEOVIM_SRC))
OS := $(shell uname -s)

ifeq ($(OS), Linux)
	LN_FLAGS="-sfT"
else ifeq ($(OS), Darwin)
	LN_FLAGS="-sfh"
else
	$(error unknown OS $(OS)))
endif

.PHONY: deploy link_files ansible submodule fzf

deploy: link_files

link_files: $(DOTFILES) $(NEOVIM_RC) $(NEOVIM_FILES)

$(DOTFILES): $(HOME)/.%: $(RC_DIR)/%
	-mkdir -p $(dir $@)
	-ln $(LN_FLAGS)  $< $@

$(NEOVIM_RC): $(RC_DIR)/vimrc
	-mkdir -p $(dir $@)
	-ln $(LN_FLAGS)  $< $@


$(NEOVIM_FILES): $(HOME)/.config/nvim/%:$(RC_DIR)/vim/%
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

.PHONY: show_dotfiles
show_dotfiles:
	@echo $(DOTFILES)

