### setup

ubuntu 18.04
```
sudo apt-get install -y xsel
sudo apt-get install -y peco
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/shoichi1023/dotfiles.git
cp ./dotfiles/.tmux.conf ~/
cp ./dotfiles/.vimrc ~/
tmux
```
press C-t I

```
vi
:NeoBundleInstall
sq 
```
 
then, your edit .bashrc  
please copy src in .bashrc_add  
and paste on .bashrc

```
cd
source .bashrc 
```


