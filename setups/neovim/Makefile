# Destination path for Neovim's init.vim
NEOVIM_RC := $(HOME)/.config/nvim/init.vim

# Find all source files for Neovim
CONFIG_SRC := $(shell find config -type f -print)

# Destination paths for other Neovim files, using absolute path for the target
CONFIG_TARGETS := $(patsubst config/%, $(HOME)/.config/nvim/%, $(CONFIG_SRC))

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

all: $(NEOVIM_RC) $(CONFIG_TARGETS)

$(NEOVIM_RC): vimrc
		@mkdir -p $(dir $@)
		ln $(LN_FLAGS) $(realpath $<) $@

# Linking other Neovim files
$(CONFIG_TARGETS): $(HOME)/.config/nvim/%: config/%
		@mkdir -p $(dir $@)
		ln $(LN_FLAGS) $(realpath $<) $@
