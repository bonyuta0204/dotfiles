#!/bin/sh
ln -sfi ~/dotfiles/vimrc ~/.vimrc
ln -sfi ~/dotfiles/gvimrc ~/.gvimrc
# ln -sf ~/dotfiles/.vim ~/.vim
ln -sfi ~/dotfiles/bashrc ~/.bashrc
ln -sfi ~/dotfiles/bash_profile ~/.bash_profile

SNIPPET_DIR=~/.vim/bundle/neosnippet-snippets

if [ -d ${SNIPPET_DIR} > /dev/null ]; then
  rm -rf ${SNIPPET_DIR}/snippets
  ln -sdfi ~/dotfiles/snippets ${SNIPPET_DIR}
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
