#!/bin/sh
ln -si ~/dotfiles/vim/vimrc ~/.vimrc
ln -si ~/dotfiles/vim/gvimrc ~/.gvimrc
ln -si ~/dotfiles/bashrc ~/.bashrc
ln -si ~/dotfiles/bash_profile ~/.bash_profile
ln -si ~/dotfiles/tmux.conf ~/.tmux.conf


SNIPPET_DIR=~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets
VIM_DIR=~/.vim


# vim setting
if [ -d $HOME/.vim/dein > /dev/null ]; then
  mkdir -p $HOME/.vim/dein
  ln -si ~/dotfiles/vim/plugins.toml ~/.vim/dein
  ln -si ~/dotfiles/vim/lazy.toml ~/.vim/dein
fi


# vim after directory should be placed on
# e.g. ~/dotfiles/after/ftplugin/python.vim
if [ -d ${VIM_DIR} > /dev/null ]; then
  ln -siT ~/dotfiles/vim/after "${VIM_DIR}/after"
fi


# snippets files should place on
# e.g. ~/dotfiles/snippets/ruby.snip
if [ -d ${SNIPPET_DIR} > /dev/null ]; then
  ln -si ~/dotfiles/vim/snippets ${SNIPPET_DIR}
fi


# symlink for nvim
if command -v nvim > /dev/null ; then
  ln -siT ~/.vim ~/.config/nvim
  ln -siT ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
  ln -siT ~/dotfiles/vim/ale_linters ~/.vim/ale_linters
fi


# make symbolic link for fish config file
fish_symlink(){
  local dotroot
  local fishroot
  dotroot="$HOME/dotfiles/config"
  fishroot="$HOME/.config"
  ln -si "$dotroot/fish/config.fish" "$fishroot/fish/config.fish"
  ln -si "$dotroot/fish/fishfile" "$fishroot/fish/fishfile"
  ln -si --target-directory="$HOME/.config/fish/functions" $HOME/dotfiles/config/fish/functions/*
}


if command -v fish > /dev/null ; then
  fish_symlink
fi
