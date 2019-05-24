apt update
apt upgrade
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp .tmux.conf ~/.tmux.conf
sudo apt install -y peco translate-shell xsel
cp ./dein/.vimrc ~/.vimrc
mkdir ~/.vim/rc/
cp ./dein/plugin.toml ~/.vim/rc/plugin.toml
cp ./.bashrc_add ~/.bashrc
cp ./.bash_profile ~/.bash_profile
sudo apt install -y nodebrew
nodebrew setup
nodebrew install-binary latest
nodebrew use latest
npm install -g prettier-eslint
sudo apt install -y golang
mkdir ~/src/github.com/
