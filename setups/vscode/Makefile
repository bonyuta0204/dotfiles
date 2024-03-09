# VSCode setting root directory
VSCODE_ROOT := ~/Library/Application\ Support/Code/User

# VSCode setting root directory
VSCODE_INSIDER_ROOT := ~/Library/Application\ Support/Code\ -\ Insiders/User

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

all: $(VSCODE_ROOT)/settings.json $(VSCODE_INSIDER_ROOT)/settings.json

# Lining VSCode settings.json
$(VSCODE_ROOT)/settings.json: settings.json
	-mkdir -p $(VSCODE_ROOT)
	-ln $(LN_FLAGS)  $(realpath $<) "$@"

$(VSCODE_INSIDER_ROOT)/settings.json: settings.json
	-mkdir -p $(VSCODE_INSIDER_ROOT)
	-ln $(LN_FLAGS)  $(realpath $<) "$@"

