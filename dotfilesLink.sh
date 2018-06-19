#!/bin/sh
ln -sfi ~/dotfiles/vimrc ~/.vimrc
# ln -sf ~/dotfiles/.vim ~/.vim
ln -sfi ~/dotfiles/bashrc ~/.bashrc

SNIPPET_DIR=~/.vim/bundle/neosnippet-snippets

echo ${SNIPPET_DIR}
if [ -d ${SNIPPET_DIR} ]; then
	rm -rf ${SNIPPET_DIR}/snippets
	ln -sdfi ~/dotfiles/snippets ${SNIPPET_DIR}
fi
