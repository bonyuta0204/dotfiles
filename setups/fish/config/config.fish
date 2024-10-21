# -----------------------------------------
# Fish Shell Configuration
# -----------------------------------------
# This file is autoloaded when Fish starts.

# -----------------------------------------
# Terminal Settings
# -----------------------------------------
# Enable true color in terminal
set fish_term24bit 1
# Set terminal color support
set -gx TERM xterm-256color

set -gx SHELL "/usr/local/bin/fish"

# -----------------------------------------
# PATH Settings
# -----------------------------------------
# Load PATH variable set by other shell (e.g., bash)
set PATH $TO_FISH_PATH $PATH

set -gx PATH "$HOME/.local/bin" $PATH
set -gx PATH "$HOME/workspace/github.com/oven-sh/bun/build" $PATH

# -----------------------------------------
# Version Manager Initializations
# -----------------------------------------
# Volta
set -gx VOLTA_HOME "$HOME/.volta"

# Go
if test -d /usr/local/go
    set -gx PATH "/usr/local/go/bin" $PATH
end
if test -d ~/go
    set -gx GOBIN $HOME/go/bin
    set -gx GOPATH $HOME/go
end

# Rust
if test -f "$HOME/.cargo/env"
  fish_add_path "$HOME/.cargo/bin"
end

# Bun
set -gx BUN_INSTALL "$HOME/.bun"

# pnpm
set -gx PNPM_HOME "/Users/yutanakamura/Library/pnpm"

fish_add_path $HOME/.cabal/bin
fish_add_path "$HOME/.ghcup/bin"

# -----------------------------------------
# Environment Initializations
# -----------------------------------------
# Rbenv Initialization
if command -v rbenv > /dev/null
    status --is-interactive; and source (rbenv init -|psub)
end

# Pyenv Initialization
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# Direnv Initialization
if command -v direnv > /dev/null
    direnv hook fish | source
end

# Starship Prompt Initialization
if command -v starship > /dev/null
    starship init fish | source
end

# Conda Initialization
if command -v conda > /dev/null
    eval conda "shell.fish" "hook" $argv | source
end

# anyenv Initialization
if command -v anyenv > /dev/null
    status --is-interactive; and source (anyenv init -|psub)
end

# Homebrew Initialization (Intel and Apple Silicon)
if test -f "/opt/homebrew/bin/brew"
    source ("/opt/homebrew/bin/brew" shellenv | psub)
else if test -f "/usr/local/bin/brew"
    source ("/usr/local/bin/brew" shellenv | psub)
else
    echo "Homebrew is not installed."
end

# -----------------------------------------
# Git and Fuzzy Finder Settings
# -----------------------------------------
# Git Prompt Settings
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch FFEE99
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# FZF (fuzzy finder) configuration
set -gx FZF_DEFAULT_OPTS '--height=40% --reverse --border'

# -----------------------------------------
# Custom Functions
# -----------------------------------------
# Fuzzy Finder Functions
function fuzzy_find_pr -d "Fuzzy-find a Pull Request ID"
    gh pr list --limit 100 | fzf | awk '{print $1}'
end

function fuzzy_find_git_branch -d "Fuzzy-find a Git Branch"
    git branch --all | grep -v HEAD | string trim | fzf
end

function fcb -d "Fuzzy-find and Checkout a Branch"
    set branch (fuzzy_find_git_branch)
    git checkout "$branch"
end

function fcp -d "Fuzzy-find and Checkout a Pull Request"
    set pr_id (fuzzy_find_pr)
    gh pr checkout $pr_id
end

function fmb -d "Fuzzy-find and Merge a Branch"
    set branch (fuzzy_find_git_branch)
    git merge "$branch"
end

function fmp -d "Fuzzy-find and Merge a Pull Request"
    set pr_id (fuzzy_find_pr)
    gh pr view $pr_id --jq ".headRefName" --json "headRefName" | read -l branch_name
    git merge origin/$branch_name
end

# ghq + fzf Integration
function ghq_fzf_repo -d 'Repository search'
    ghq list --full-path | fzf | read select
    [ -n "$select" ]; and cd "$select"
    echo " $select "
    commandline -f repaint
end

# -----------------------------------------
# Key Bindings
# -----------------------------------------
# Bind custom functions to key combinations
function fish_user_key_bindings
    bind \cg ghq_fzf_repo
end

# -----------------------------------------
# Alias Definitions
# -----------------------------------------
# Common command aliases for convenience
alias diff="diff -u"
alias ssh="ssh -X -Y"
alias view="vim -R"
alias gr="grep -i -r"
alias ll='ls -lh'
alias la='ls -al'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
