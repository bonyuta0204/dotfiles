CONFIG_SRC := AGENTS.md
CONFIG_TARGETS := $(HOME)/.codex/AGENTS.md

OS := $(shell uname -s)

ifeq ($(OS), Linux)
	LN_FLAGS=-sfT
else ifeq ($(OS), Darwin)
	LN_FLAGS=-sfh
else
	$(error unknown OS $(OS))
endif

all: $(CONFIG_TARGETS)

$(CONFIG_TARGETS): $(CONFIG_SRC)
	@mkdir -p $(dir $@)
	@ln $(LN_FLAGS) $(realpath $<) $@
