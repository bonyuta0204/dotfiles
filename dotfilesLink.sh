#!/bin/sh
ln -sfi ~/dotfiles/vim/vimrc ~/.vimrc
ln -sfi ~/dotfiles/vim/gvimrc ~/.gvimrc
ln -sfi ~/dotfiles/bashrc ~/.bashrc
ln -sfi ~/dotfiles/bash_profile ~/.bash_profile


SNIPPET_DIR=~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets
VIM_DIR=~/.vim


# vim setting
if [ -d $HOME/.vim/dein > /dev/null ]; then
  mkdir -p $HOME/.vim/dein
  ln -sfi ~/dotfiles/vim/plugins.toml ~/.vim/dein
  ln -sfi ~/dotfiles/vim/lazy.toml ~/.vim/dein
fi


# vim after directory should be placed on
# e.g. ~/dotfiles/after/ftplugin/python.vim
if [ -d ${VIM_DIR} > /dev/null ]; then
  ln -sdfi ~/dotfiles/vim/after ${VIM_DIR}
fi


# snippets files should place on
# e.g. ~/dotfiles/snippets/ruby.snip
if [ -d ${SNIPPET_DIR} > /dev/null ]; then
  ln -sdfi ~/dotfiles/vim/snippets ${SNIPPET_DIR}
fi


# symlink for nvim
if command -v nvim > /dev/null ; then
  ln -sfi ~/.vim ~/.config/nvim
  ln -sfi ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
fi


# make symbolic link for fish config file
fish_symlink(){
  local dotroot
  local fishroot
  dotroot="$HOME/dotfiles/config"
  fishroot="$HOME/.config"
  ln -sfi "$dotroot/fish/config.fish" "$fishroot/fish/config.fish"
  ln -sfi "$dotroot/fish/fishfile" "$fishroot/fish/fishfile"
  ln -sfi --target-directory="$HOME/.config/fish/functions" $HOME/dotfiles/config/fish/functions/*
}


if command -v fish > /dev/null ; then
  fish_symlink
fi
