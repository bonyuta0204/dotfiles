#!/bin/bash
# .bash_profile
# User specific environment and startup programs
export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$HOME/local/bin:$PATH"
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

TERM=xterm-256color

if [ -d ~/.node_modules_global ]; then
  export PATH="$PATH:$HOME/.node_modules_global/bin"
fi

if [ -d ~/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

if [ -d ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# use fish when available
if command -v fish &> /dev/null; then
  exec fish
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
