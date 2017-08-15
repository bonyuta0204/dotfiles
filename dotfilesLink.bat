@echo off

mklink %HOMEPATH%"\_vimrc" %HOMEDRIVE%%HOMEPATH%"\dotfiles\.vimrc"
mklink /D %HOMEPATH%"\.vim\colors" %HOMEDRIVE%%HOMEPATH%"\dotfiles\colors"
mklink %HOMEPATH%"\_gvimrc" %HOMEDRIVE%%HOMEPATH%"\dotfiles\.gvimrc"
