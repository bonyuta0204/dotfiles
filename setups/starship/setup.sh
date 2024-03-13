#!/bin/bash
#
set -eu

if command -v starship > /dev/null; then
  mkdir -p ~/.config
  ln -sf $(realpath starship.toml) ~/.config/starship.toml
fi
