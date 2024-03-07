# Destination path for Neovim's init.vim
VIM_RC := $(HOME)/.vimrc

# Find all source files for Neovim
CONFIG_SRC := $(shell find ../neovim/config -type f -print)

# Destination paths for other Neovim files, using absolute path for the target
CONFIG_TARGETS := $(patsubst ../neovim/config/%, $(HOME)/.vim/%, $(CONFIG_SRC))

# Determine OS type
OS := $(shell uname -s)

# Conditional logic for setting up symlink flags based on OS
ifeq ($(OS), Linux)
		LN_FLAGS=-sfT
else ifeq ($(OS), Darwin)
		LN_FLAGS=-sfh
else
		$(error unknown OS $(OS))
endif

all: $(VIM_RC) $(CONFIG_TARGETS)

$(VIM_RC): ../neovim/vimrc
		@mkdir -p $(dir $@)
		ln $(LN_FLAGS) $(realpath $<) $@

# Linking other Neovim files
$(CONFIG_TARGETS): $(HOME)/.vim/%: ../neovim/config/%
		@mkdir -p $(dir $@)
		ln $(LN_FLAGS) $(realpath $<) $@
