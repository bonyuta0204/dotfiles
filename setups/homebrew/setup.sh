#!/bin/bash
#
set -eu

if command -v brew > /dev/null; then
  ln -sf $(realpath Brewfile) ~/Brewfile
fi
