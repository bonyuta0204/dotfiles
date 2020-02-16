@echo off

call :force_link %HOMEPATH%"\.vimrc" %HOMEDRIVE%%HOMEPATH%"\dotfiles\vim\vimrc"
call :force_link %HOMEPATH%"\.vim\dein\plugins.toml" %HOMEDRIVE%%HOMEPATH%"\dotfiles\vim\plugins.toml"
call :force_link %HOMEPATH%"\.vim\dein\lazy.toml" %HOMEDRIVE%%HOMEPATH%"\dotfiles\vim\lazy.toml"
call :force_link %HOMEPATH%"\.gvimrc" %HOMEDRIVE%%HOMEPATH%"\dotfiles\vim\gvimrc"
call :force_link %HOMEPATH%"\.bashrc" %HOMEDRIVE%%HOMEPATH%"\dotfiles\bashrc"
call :force_link %HOMEPATH%"\.bash_profile" %HOMEDRIVE%%HOMEPATH%"\dotfiles\bash_profile"

exit /b

:force_link
del %1
mklink %1 %2

exit /b