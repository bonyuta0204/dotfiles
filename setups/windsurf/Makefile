# VSCode setting root directory
WINDSURF_ROOT := ~/Library/Application\ Support/Windsurf/User
GLOBAL_RULE_CONFIG := $(HOME)/.codeium/windsurf/memories/global_rules.md

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

all: $(WINDSURF_ROOT)/settings.json $(GLOBAL_RULE_CONFIG)

# Linking VSCode settings.json
$(WINDSURF_ROOT)/settings.json: settings.json
	mkdir -p "$(dir $@)"
	ln $(LN_FLAGS) $(realpath $<) "$@"

# Memory File
$(GLOBAL_RULE_CONFIG): global_rules.md
	mkdir -p "$(dir $@)"
	ln $(LN_FLAGS) $(realpath $<) "$@"
