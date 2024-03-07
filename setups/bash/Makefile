# Find all config files
CONFIG_SRC := bashrc bash_profile $(shell find bashrc.d -type f -print)

# Destination paths for config files
CONFIG_TARGETS := $(patsubst %, $(HOME)/.%, $(CONFIG_SRC))

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

all: $(CONFIG_TARGETS)

$(CONFIG_TARGETS): $(HOME)/.% : %
		@mkdir -p $(dir $@)
		ln $(LN_FLAGS) $(realpath $<) $@


