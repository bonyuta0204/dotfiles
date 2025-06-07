DOTFILES_DIR := $(shell git rev-parse --show-toplevel)
CLAUDE_DIR := ~/.claude

TARGETS := settings.json

.PHONY: deploy clean

deploy:
	@echo "Deploying Claude Code settings..."
	@mkdir -p $(CLAUDE_DIR)
	@for target in $(TARGETS); do \
		echo "Linking $(CLAUDE_DIR)/$$target -> $(DOTFILES_DIR)/setups/claude/$$target"; \
		ln -sfnv $(DOTFILES_DIR)/setups/claude/$$target $(CLAUDE_DIR)/$$target; \
	done
	@echo "Claude Code settings deployed successfully!"

clean:
	@echo "Removing Claude Code settings..."
	@for target in $(TARGETS); do \
		if [ -L $(CLAUDE_DIR)/$$target ]; then \
			echo "Removing symlink $(CLAUDE_DIR)/$$target"; \
			rm -f $(CLAUDE_DIR)/$$target; \
		fi; \
	done
	@echo "Claude Code settings removed!"