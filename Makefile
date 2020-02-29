DOTFILES_SRC := $(shell find rc/ -type f -print)
DOTFILES := $(patsubst rc/%, ~/.%, $(DOTFILES_SRC))

$(warning DOTFILES := $(DOTFILES))
$(warning DOTFILES_SRC := $(DOTFILES_SRC))

deploy: $(DOTFILES)

link_files: $(DOTFILES)

$(DOTFILES): $(HOME)/.%: rc/%
	mkdir -p $(dir $@)
	ln $@ $<
