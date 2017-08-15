@echo off
echo %HOMEPATH%
mklink %HOMEPATH%"\_vimrc" %HOMEPATH%"\dotfiles\.vimrc"
mklink /D %HOMEPATH%"\.vim\colors" %HOMEPATH%"dotfiles\colors"
