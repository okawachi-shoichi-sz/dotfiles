"*****************************************************************************
" NeoBundle core
"*****************************************************************************
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
let sublimemonokai_vim=expand('~/.vim/colors/sublimemonokai.vim')

let g:vim_bootstrap_langs = "javascript,ruby,python,html,go"
let g:vim_bootstrap_editor = "vim"

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"

  " Run shell script if exist on custom select language
endif

if !filereadable(sublimemonokai_vim)
  echo "Installing sublimemonokai Theme..."
  echo ""

  silent !mkdir -p ~/.vim/colors
  silent !mkdir -p ~/.vim/tmp
  silent !git clone https://github.com/ErichDonGubler/vim-sublime-monokai.git ~/.vim/tmp/sublimemonokai
  !mv ~/.vim/tmp/sublimemonokai/colors/sublimemonokai.vim ~/.vim/colors/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
""" Functions
"*****************************************************************************
function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

"*****************************************************************************
"" VimProc DLL Path
"*****************************************************************************
if has('mac')
  let g:vimproc_dll_path = $HOME.'/.vim/bundle/vimproc.vim/lib/vimproc_mac.so'
elseif has('win32')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win32.dll'
elseif has('win64')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win64.dll'
elseif has('unix')
  let g:vimproc_dll_path = $HOME."/.vim/bundle/vimproc.vim/lib/vimproc_linux64.so"
endif

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle 'ErichDonGubler/vim-sublime-monokai'

""FileTree
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

"" vimproc
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make -f make_unix.mak',
\     'unix' : 'gmake -f make_unix.mak',
\    },
\ }

"" 補完
if s:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete'
	"" NeoBundle 'supermomonga/neocomplete-rsense.vim', {'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],}
else
	NeoBundle 'Shougo/neocomplcache'
	"" NeoBundle 'Shougo/neocomplcache-rsense.vim', {'depends': ['Shougo/neocomplcache.vim', 'marcus/rsense'],}
endif

"" スニペット
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

"" ctags
NeoBundle 'majutsushi/tagbar'
NeoBundle 'szw/vim-tags'
NeoBundle 'soramugi/auto-ctags.vim'

NeoBundle 'tpope/vim-endwise'

"" 構文チェック
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim'

"" markdownプレビュー
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

"" python構文・コーディング規約チェック
NeoBundle 'Flake8-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'hynek/vim-python-pep8-indent'

"" indent可視化
NeoBundle 'Yggdroot/indentLine'

"" HTML/CSS
NeoBundle 'vim-scripts/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'tpope/vim-surround'

NeoBundle 'pangloss/vim-javascript'
NeoBundle 'ruanyl/vim-fixmyjs'

"" JSON syntax
NeoBundle 'elzr/vim-json'

NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'jason0x43/vim-js-indent'

"" mustache / handlebars
NeoBundle 'mustache/vim-mustache-handlebars'

"" nodejs補完
NeoBundle 'myhere/vim-nodejs-complete'

"" VCL
NeoBundle 'smerrill/vcl-vim-plugin'

""submode
NeoBundle 'kana/vim-submode'

""editorconfig
NeoBundle 'editorconfig/editorconfig-vim'

""comment
NeoBundle 'tomtom/tcomment_vim'

""visualize move
NeoBundle 't9md/vim-textmanip'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

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

"" mdの修飾記号を消さない
let g:vim_markdown_conceal = 0
"" 折りたたまない
let g:vim_markdown_folding_disabled = 1

"" JSONのダブルクォーテーションを表示する
let g:vim_json_syntax_conceal = 0

"" 改行時に自動でコメントを挿入するのを防ぐ
autocmd FileType * setlocal formatoptions-=ro

let g:vim_json_syntax_conceal=0

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
"" NERDTree
"*****************************************************************************
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
noremap <leader>n :NERDTreeTabsToggle<CR>

"*****************************************************************************
"" Copy/Paste/Cut
"*****************************************************************************
set clipboard+=unnamed

"******************
"" neosnippet
"******************
imap <c-k>     <Plug>(neosnippet_expand_or_jump)
smap <c-k>     <Plug>(neosnippet_expand_or_jump)
xmap <c-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<TAB>"
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

"******************
"" neocomplete
"******************
if s:meet_neocomplete_requirements()
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
else
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

"******************
" tagbar
"******************
if ! empty(neobundle#get("tagbar"))
  let g:tagbar_width = 20
  nn <silent> <leader>t :TagbarToggle<CR>
endif

"******************
" ctags
"******************
let g:vim_tags_project_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
let g:vim_tags_auto_generate = 1
set tags+=.tags
set tags+=.Gemfile.lock.tags

if has("path_extra")
  set tags+=tags;
endif

nnoremap <C-]> g<C-]>

"******************
" syntastic
"******************
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_scss_checkers = ['scss_lint']

let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"*****************
" lint
"*****************"
let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_legacy_jshint = 1

"******************
" typescript
"******************
au BufRead,BufNewFile,BufReadPre *.ts set filetype=typescript
autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et

let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
			\    'variables': {
			\      'lang': "ja"
			\    },
			\   'indentation': '  '
			\ }

"******************
" rsense
"******************
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

"******************
" PyFlake
"******************
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10

"******************
" jedi
"******************
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

"******************
" typescript
"******************
autocmd BufRead,BufNewFile *.ts set filetype=typescript
let g:typescript_indent_disable = 1

"******************
" indentLine
"******************
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail']

"******************
" mustache / handlebars
"******************
let g:mustache_abbreviations = 1

"******************
" vim-nodejs-complete
"******************
:setl omnifunc=jscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

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

"*****************************************************************************
" Visualize move
"****************************************************************************"
xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" toggle insert/replace with <F10>
nmap <F10> <Plug>(textmanip-toggle-mode)
xmap <F10> <Plug>(textmanip-toggle-mode)

"****************************************************************************
" Translate
"***************************************************************************"
let s:trans_cmd = 'trans'
let s:trans_opt = '-b :en --no-ansi -e google'
exec 'command! -nargs=0 -range Trans <line1>,<line2>!' . s:trans_cmd . ' ' . s:trans_opt
nnoremap <C-e> :Trans<CR>

"*****************************************************************************
" KeyMap
"*****************************************************************************"
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
nnoremap <C-f> :Fixmyjs<CR>
nnoremap <C-c> :Ctags<CR>
nnoremap <C-p> :PrevimOpen<CR>
nnoremap <C-h> : if exists("syntax_on") <BAR>
                \    syntax off <BAR>
                \ else <BAR>
                \    syntax enable <BAR>
                \ endif<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
