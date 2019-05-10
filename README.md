# dotfiles

windowsでの使用は想定してないのであしからず。

all

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
npm install -g prettier-eslint
```

and please add the contents of .bashrc_add to .bashrc


ubuntu

```
sudo apt-get install -y xsel ctags peco translate-shell
```

mac

```
brew install ctags peco translate-shell
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

新規window：c  
前のwindowへ移動：p  
次のwindowへ移動：n  
session一覧：s

#
### vim

prefix : s  

水平分割 : -  
垂直分割 : \  

ペイン移動：(kjlh)

ペインごと移動：(KJLH)

タブ幅  
左 : >  
右 : <   

新規タブ : t  
次のタブへ : n  
前のタブへ : p  
タブの位置を一つ後に：N
タブの位置を一つ前に：P

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

Tagバーを表示 : <Space - t>(prefixなし)   

vで選択した文字列を任意の文字で囲う　:　S<任意の文字>(prefixなし)  
囲われた文字列を別の文字で囲う　:　cs<任意の文字>(prefixなし)  
囲われた文字列の囲いを外す　:　ds<今囲われている文字>(prefixなし)  
一単語を任意の文字で囲う　:　ysiw<任意の文字>(prefixなし)  

vで選択して移動 ：　\<C-(hjkl)>(prefixなし)  

コメント切り替え ：　\<C- _ >\<C- _ >(prefixなし)  

mdプレビュー：<C - p>(prefixなし)  
ctag生成：<C - c>(prefixなし)  
fix-fomat(js)：(保存した後)<C - f>(prefixなし)  
カーソル上の１行を英語に翻訳： <C - e>(prefixなし)  
スニペット展開：<C - x>(prefixなし)

ファイルツリー : <Space+n>(prefixなし)  
ファイルツリー上で  
分割して開く：s  
新規タブで開く：t  
ファイル操作：m  


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
 - コメント切り替え
 - 英語翻訳

 邪魔だったのでカーソルの点滅をなくし、対応する括弧を強調する際に、現在位置のカーソル色を見やすく変更した。
 
### 参考
 [IDEっぽいvim環境を構築する.vimrcを書いた](https://qiita.com/ysm001/items/8ae97cfdaae3f5fe79f4)
 
 [Vimの便利な画面分割＆タブページと、それを更に便利にする方法](https://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca)
 
 [Vimでタブ使ってる人におすすめのやつ](https://qiita.com/yaginuuu/items/d0a8d045035ab251c96c)
 
 
 
