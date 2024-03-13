#!/bin/bash
#
set -eu

if command -v tmux > /dev/null; then
  ln -sf $(realpath tmux.conf) ~/.tmux.conf
fi
