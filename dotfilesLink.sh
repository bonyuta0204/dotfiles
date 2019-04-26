#!/bin/sh
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/gvimrc ~/.gvimrc
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf


SNIPPET_DIR=~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets
VIM_DIR=~/.vim


# vim setting
if [ -d $HOME/.vim/dein > /dev/null ]; then
  mkdir -p $HOME/.vim/dein
  ln -sf ~/dotfiles/vim/plugins.toml ~/.vim/dein/plugins.toml
  ln -sf ~/dotfiles/vim/lazy.toml ~/.vim/dein/lazy.toml
fi


# vim after directory should be placed on
# e.g. ~/dotfiles/after/ftplugin/python.vim
if [ -d ${VIM_DIR} > /dev/null ]; then
  ln -sfh ~/dotfiles/vim/after "${VIM_DIR}/after"
fi


# snippets files should place on
# e.g. ~/dotfiles/snippets/ruby.snip
if [ -d ${SNIPPET_DIR} > /dev/null ]; then
  ln -si ~/dotfiles/vim/snippets ${SNIPPET_DIR}
fi


# symlink for nvim
if command -v nvim > /dev/null ; then
  if [ ! -d $HOME/.config/nvim ]; then
    mkdir -p $HOME/.config/nvim
  fi
  ln -sfh ~/.vim ~/.config/nvim
  ln -sfh ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
  ln -sfh ~/dotfiles/vim/ale_linters ~/.vim/ale_linters
fi


# make symbolic link for fish config file
fish_symlink(){
  local dotroot
  local fishroot
  dotroot="$HOME/dotfiles/config"
  fishroot="$HOME/.config"
  ln -si "$dotroot/fish/config.fish" "$fishroot/fish/config.fish"
  ln -si "$dotroot/fish/fishfile" "$fishroot/fish/fishfile"
  if [ ! -d $HOME/.config/fish/functions > /dev/null ]; then
    mkdir -p "$HOME/.config/fish/functions"
  fi
  ln -si $HOME/dotfiles/config/fish/functions/* "$HOME/.config/fish/functions"
}


if command -v fish > /dev/null ; then
  fish_symlink
fi
