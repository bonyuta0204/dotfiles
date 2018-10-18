#!/bin/sh
ln -sfi ~/dotfiles/vim/vimrc ~/.vimrc
ln -sfi ~/dotfiles/vim/gvimrc ~/.gvimrc
ln -sfi ~/dotfiles/bashrc ~/.bashrc
ln -sfi ~/dotfiles/bash_profile ~/.bash_profile

SNIPPET_DIR=~/.vim/bundle/neosnippet-snippets
VIM_DIR=~/.vim


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


# make symbolic link for fish config file
fish_symlink(){
  local dotroot
  local fishroot
  dotroot="$HOME/dotfiles/config"
  fishroot="$HOME/.config"
  ln -sfi "$dotroot/fish/config.fish" "$fishroot/fish/config.fish"
  ln -sfi "$dotroot/fish/fishfile" "$fishroot/fish/fishfile"
  ln -sdfi "$dotroot/fish/functions" "$fishroot/fish"
}


if command -v fish > /dev/null ; then
  fish_symlink
fi
