@echo off
echo %HOMEDRIVE%%HOMEPATH%"\dotfiles\colors"
mklink %HOMEPATH%"\_vimrc" %HOMEDRIVE%%HOMEPATH%"\dotfiles\.vimrc"
mklink /D %HOMEPATH%"\vimfiles\colors" %HOMEDRIVE%%HOMEPATH%"\dotfiles\colors\"
mklink %HOMEPATH%"\_gvimrc" %HOMEDRIVE%%HOMEPATH%"\dotfiles\.gvimrc"
