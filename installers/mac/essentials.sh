# install homebrew
if ! command -v brew > /dev/null;then
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew install 
# NOTE: continue even if brew install fails
brew bundle || true
