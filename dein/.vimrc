"*****************************************************************************
"" Install
"*****************************************************************************"

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'


" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" カラーテーマがなければインストール
let sublimemonokai_vim=expand('~/.vim/colors/sublimemonokai.vim')

if !filereadable(sublimemonokai_vim)
  echo "installing sublimemonokai theme..."
  echo ""

  silent !mkdir -p ~/.vim/colors
  silent !mkdir -p ~/.vim/tmp
  silent !git clone https://github.com/erichdongubler/vim-sublime-monokai.git ~/.vim/tmp/sublimemonokai
  !mv ~/.vim/tmp/sublimemonokai/colors/sublimemonokai.vim ~/.vim/colors/
endif


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

let mapleader="\<Space>"

""column number
set number

"" filename
set statusline=%f
set statusline+=%=
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']'}
set statusline+=[LOW=%l/%L]

" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set binary
set ttyfast

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

set whichwrap=h,l,b,s,<,>,[,]

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite


"**************************************************************************
" plugins
"*************************************************************************"

"" 改行時に自動でコメントを挿入するのを防ぐ
autocmd FileType * setlocal formatoptions-=ro

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/plugin.toml'
  "let s:lazy_toml = g:rc_dir . '/plugin_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  "call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


" Required:
filetype plugin indent on


"*****************************************************************************
"" Visual Settings
"*****************************************************************************

syntax enable
set background=dark
colorscheme sublimemonokai
set ruler
highlight StatusLine ctermfg=250 ctermbg=0
highlight StatusLineNC ctermfg=0 ctermbg=250


"*****************************************************************************
"" Copy/Paste/Cut
"*****************************************************************************

set clipboard+=unnamed


"*****************************************************************************
" Indent Width
"*****************************************************************************"

set shiftwidth=2
set tabstop=2

augroup indent
  autocmd! FileType python setlocal shiftwidth=4 tabstop=4
augroup END

set autoindent
set expandtab


"*****************************************************************************
" Large File
"*****************************************************************************"

set synmaxcol=256
set nowrap

" file is large from 10mb
let g:LargeFile = 1024 * 100
augroup LargeFile
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
  " no syntax highlighting etc
  set eventignore+=FileType
  " save memory when other file is viewed
  setlocal bufhidden=unload
  " display message
  autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction


"*****************************************************************************
"TagHighLight
"****************************************************************************"

hi MatchParen term=standout ctermbg=24 ctermfg=white
if has('vim_starting')
  " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[2 q"
  " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[2 q"
  " 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"
endif


"****************************************************************************
" Translate
"***************************************************************************"

let s:trans_cmd = 'trans'
let s:trans_opt = '-b :en --no-ansi -e google'
exec 'command! -nargs=0 -range Trans <line1>,<line2>!' . s:trans_cmd . ' ' . s:trans_opt
nnoremap <C-e> :Trans<CR>


"*****************************************************************************
" KeyMap
"****************************************************************************"

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sN :<C-u>tabm +1<CR>
nnoremap sP :<C-u>tabm -1<CR>
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap s- :<C-u>sp<CR>
nnoremap s\ :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sw :<C-u>w<CR>
nnoremap swq :<C-u>wq<CR>
nnoremap sQ :<C-u>q!<CR>
nnoremap <C-s> :<C-u>w<CR>
nnoremap <C-n> :<C-u>noh<CR>
nnoremap <C-h> : if exists("syntax_on") <BAR>
                \    syntax off <BAR>
                \ else <BAR>
                \    syntax enable <BAR>
                \ endif<CR>

