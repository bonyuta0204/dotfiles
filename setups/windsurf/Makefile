# VSCode setting root directory
WINDSURF_ROOT := ~/Library/Application\ Support/Windsurf/User

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

all: $(WINDSURF_ROOT)/settings.json

# Lining VSCode settings.json
$(WINDSURF_ROOT)/settings.json: settings.json
	-mkdir -p $(WINDSURF_ROOT)
	-ln $(LN_FLAGS)  $(realpath $<) "$@"
