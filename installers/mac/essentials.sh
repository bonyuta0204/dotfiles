# install homebrew
if ! command -v brew > /dev/null;then
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# install latest VIM
brew install vim
# install neovim
brew install python3
brew install neovim
pip3 install neovim

# install tmux
brew install tmux

# install tig
brew install tig

# install ag
brew install ag

# install fish
brew install fish
