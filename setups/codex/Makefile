CONFIG_SRCS := AGENTS.md config.toml
CONFIG_TARGETS := $(HOME)/.codex/AGENTS.md $(HOME)/.codex/config.toml

OS := $(shell uname -s)

ifeq ($(OS), Linux)
	LN_FLAGS=-sfT
else ifeq ($(OS), Darwin)
	LN_FLAGS=-sfh
else
	$(error unknown OS $(OS))
endif

all: $(CONFIG_TARGETS)

$(HOME)/.codex/AGENTS.md: AGENTS.md
	@mkdir -p $(dir $@)
	@ln $(LN_FLAGS) $(realpath $<) $@

$(HOME)/.codex/config.toml: config.toml
	@mkdir -p $(dir $@)
	@ln $(LN_FLAGS) $(realpath $<) $@
