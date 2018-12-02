# dotfiles

use ubuntu18.04

その他のOSについては各々カスタマイズしてください。  
多分macではだいたい動くと思う(Clipboardの共有だけ違うかも？)  
windowsはパス周りとClipboardの周辺直せば動くと思う。  

```
sudo apt-get install xsel
git clone https://github.com/shoichi1023/dotfiles.git
cp ./dotfiles/.tmux.conf ~/
cp ./dotfiles/.vimrc ~/
vi
```

in vim

```
:NeoBundleInstall
```

## KeyBind
### tmux

prefix : <C+t>  

水平分割 : -  
垂直分割 : \  

ペイン移動  
上 : k  
下 : j  
左 : l  
右 : h  

#
### vim

prefix : s  

水平分割 : -  
垂直分割 : \  

ペイン移動  
上 : k  
下 : j  
左 : l  
右 : h  

タブ幅  
上 : K  
下 : J  
左 : L  
右 : H  

新規タブ : t  
次のタブへ : n  
前のタブへ : p  

:q : q  
:w : w  
:w : \<C-s\>(prefixなし)  

※.bashrcに

```
stty stop undef
stty start undef
```
の設定が必要。  
:wq : wq  
:q! : Q  

ファイルツリー : <Space+n>(prefixなし)  

コードの展開 : <Space+k>(prefixなし)  

Tagバーを表示 : <Space+t>(prefixなし)   

vで選択した文字列を任意の文字で囲う　:　S<任意の文字>(prefixなし)  
囲われた文字列を別の文字で囲う　:　cs<任意の文字>(prefixなし)  
囲われた文字列の囲いを外す　:　ds<今囲われている文字>(prefixなし)  
一単語を任意の文字で囲う　:　ysiw<任意の文字>(prefixなし)  

vで選択して移動 <C-(hjkl)>  

### 機能

 - ファイルツリー
 - vimでタブを増やした際のファイルツリーの共有
 - カラーテーマはsublime-monokai
 - シンタックスハイライト
 - 入力補完
 - スニペット
 - 構文チェック
 - mdプレビュー
 - indent可視化
 - AutoCloseTag
 - surround
 - 選択した範囲を移動(VScodeだとalt？)
 - ファイル名表示、行番号表示

 邪魔だったのでカーソルの点滅をなくし、対応する括弧を強調する際に、現在位置のカーソル色を見やすく変更した。
 
### 参考
 [IDEっぽいvim環境を構築する.vimrcを書いた](https://qiita.com/ysm001/items/8ae97cfdaae3f5fe79f4)
 
 [Vimの便利な画面分割＆タブページと、それを更に便利にする方法](https://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca)
 
 [Vimでタブ使ってる人におすすめのやつ](https://qiita.com/yaginuuu/items/d0a8d045035ab251c96c)
 
 
 
