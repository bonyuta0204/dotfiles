#!/bin/sh

# always use `ln target link_name` format
# for example
# ln vimrc $HOME/.vimrc
# ln vim/ $HOME/.vim
# do not use `ln target directory` format 
# like `ln vim/ $HOME/`

# Options are different between linux and BSD(mac)

LN_OPTS=""

case "$(uname -s)" in
  Linux*) LN_OPTS="-sfT";;
  Darwin*) LN_OPTS="-sfh";;
  *) echo "Unknown OS type"; exit 1;;
esac

ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln $LN_OPTS ~/dotfiles/vim/gvimrc ~/.gvimrc
ln $LN_OPTS ~/dotfiles/bashrc ~/.bashrc
ln $LN_OPTS ~/dotfiles/bash_profile ~/.bash_profile
ln $LN_OPTS ~/dotfiles/tmux.conf ~/.tmux.conf


SNIPPET_DIR="~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/snippets"
VIM_DIR="~/.vim"


# vim setting
if [ -d $HOME/.vim/dein > /dev/null ]; then
  mkdir -p $HOME/.vim/dein
  ln $LN_OPTS ~/dotfiles/vim/plugins.toml ~/.vim/dein/plugins.toml
  ln $LN_OPTS ~/dotfiles/vim/lazy.toml ~/.vim/dein/lazy.toml
fi


# vim after directory should be placed on
# e.g. ~/dotfiles/after/ftplugin/python.vim
if [ -d ${VIM_DIR} > /dev/null ]; then
  ln $LN_OPTS ~/dotfiles/vim/after "${VIM_DIR}/after"
fi


# snippets files should place on
# e.g. ~/dotfiles/snippets/ruby.snip
if [ -d ${SNIPPET_DIR} > /dev/null ]; then
  ln $LN_OPTS ~/dotfiles/vim/snippets ${SNIPPET_DIR}
fi


# symlink for nvim
if command -v nvim > /dev/null ; then
  if [ ! -d $HOME/.config/nvim ]; then
    mkdir -p $HOME/.config/nvim
  fi
  ln $LN_OPTS ~/.vim ~/.config/nvim
  ln $LN_OPTS ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
  ln $LN_OPTS ~/dotfiles/vim/ale_linters ~/.vim/ale_linters
fi


# make symbolic link for fish config file
fish_symlink(){
  local dotroot
  local fishroot
  dotroot="$HOME/dotfiles/config"
  fishroot="$HOME/.config"
  ln $LN_OPTS "$dotroot/fish/config.fish" "$fishroot/fish/config.fish"
  ln $LN_OPTS "$dotroot/fish/fishfile" "$fishroot/fish/fishfile"
  if [ ! -d $HOME/.config/fish/functions > /dev/null ]; then
    mkdir -p "$HOME/.config/fish/functions"
  fi
  ln $LN_OPTS $HOME/dotfiles/config/fish/functions/* "$HOME/.config/fish/functions"
}


if command -v fish > /dev/null ; then
  fish_symlink
fi
