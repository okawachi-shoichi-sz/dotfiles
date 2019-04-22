/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install ctags peco translate-shell reattach-to-user-namespace
cp ./dein/.vimrc ~/.vimrc
mkdir ~/.vim/rc/
cp ./dein/plugin.toml ~/.vim/rc/plugin.toml
cp ./.bashrc_add ~/.bashrc
cp ./.bash_profile ~/.eash_profile
brew install nodebrew
nodebrew setup
nodebrew install-binary latest
nodebrew use latest
npm install -g prettier-eslint
brew install golang
mkdir ~/src/github.com/
