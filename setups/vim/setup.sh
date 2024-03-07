#!/bin/bash

make all

# Run PlugInstall
vim -c "PlugInstall" -c "qa"
