# Find all config files
CONFIG_SRC := $(shell find config -type f -print)

# Destination paths for config files
CONFIG_TARGETS := $(patsubst config/%, $(HOME)/.config/fish/%, $(CONFIG_SRC))

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

$(CONFIG_TARGETS): $(HOME)/.config/fish/% : config/%
		@mkdir -p $(dir $@)
		ln $(LN_FLAGS) $(realpath $<) $@


