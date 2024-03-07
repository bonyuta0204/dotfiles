#!/bin/bash

make all

# Run PlugInstall
nvim -c "PlugInstall" -c "qa"
