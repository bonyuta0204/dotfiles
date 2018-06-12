#!/bin/sh
ln -s ~/dotfiles/vimrc ~/.vimrc
# ln -sf ~/dotfiles/.vim ~/.vim
ln -sfi ~/dotfiles/bashrc ~/.bashrc

SNIPPET_DIR=~/.vim/bundle/neosnippet-snippets

echo ${SNIPPET_DIR}
if [ -d ${SNIPPET_DIR} ]; then
     echo "aaa"
	 ln -sdfi ~/dotfiles/snippets ${SNIPPET_DIR}
 fi
