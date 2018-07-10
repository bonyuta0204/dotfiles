#!/bin/bash
# .bash_profile
# User specific environment and startup programs
export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$HOME/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

TERM=xterm-256color

eval "$(rbenv init -)"

# use fish when available
if command -v fish &> /dev/null; then
  exec fish
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
