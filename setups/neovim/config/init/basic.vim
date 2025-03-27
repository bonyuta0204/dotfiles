set showcmd
set hidden "keep buffers background
set confirm "confirm to save files
"}}}
" Indent and tab {{{
set ruler
set autoindent
set shiftwidth=2
set tabstop=2
set expandtab

" for windows
set shellslash

" backup files
set noswapfile

if empty(glob('~/.vim/temp'))
  call mkdir(expand('~/.vim/temp'), "p")
endif

set backupdir=~/.vim/temp/
set directory=~/.vim/temp/
set undodir=~/.vim/temp/

" Character Settings
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set list "show listchars
set listchars=tab:>-,trail:-,nbsp:%,eol:$
set backspace=indent,start,eol
set t_vb=
set formatoptions=crql
set visualbell

" status line and Command line
set laststatus=2
set noshowmode " don't show mode. instead use lightline'
set wildmenu "command completion
set cmdheight=2

" Search Settings
set hlsearch
set incsearch

" Editor UI
set conceallevel=0
set number
set colorcolumn=80      "80文字目にラインを入れる
if has('termguicolors')
  set termguicolors
endif

"  Other Options
set clipboard=unnamed




set path+=/usr/include/**
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/**
set suffixesadd+=.h
if !has('nvim')
  set path+=~/.vim
endif
packadd! matchit
