# install homebrew
if ! command -v brew > /dev/null;then
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# install latest VIM
brew install vim
brew install neovim

# install tmux
brew install tmux

# install tig
brew install tig

# set symlink
source dotfilesLink.sh

# install dein.vim
source installers/install_dein.sh

