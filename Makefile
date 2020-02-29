DOTFILES_SRC := $(shell find rc/ -type f -print)
RC_DIR := $(realpath rc/)
DOTFILES := $(patsubst rc/%, ~/.%, $(DOTFILES_SRC))
NEOVIM_RC := $(HOME)/.config/nvim/init.vim

.PHONY: deploy link_files ansible submodule

$(warning DOTFILES := $(DOTFILES))
$(warning RC_DIR := $(RC_DIR))
$(warning DOTFILES_SRC := $(DOTFILES_SRC))

deploy: link_files

link_files: $(DOTFILES) $(NEOVIM_RC)

$(DOTFILES): $(HOME)/.%: $(RC_DIR)/%
	-mkdir -p $(dir $@)
	-ln -sfT  $< $@

$(NEOVIM_RC): $(RC_DIR)/vimrc
	-mkdir -p $(dir $@)
	-ln -sfT  $< $@

ansible: submodule
	ansible-playbook -i localhost, -c local ansible/site.yml

submodule:
	git submodule init
	git submodule update
	git submodule foreach git pull origin master
