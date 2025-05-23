let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  silent execute "source " . data_dir . "/autoload/plug.vim"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



call plug#begin()
" Plugin Manager
Plug 'junegunn/vim-plug'


" Git Client
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'


" Fuzzy Search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'


" Editor UI
Plug 'rhysd/accelerated-jk'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'voldikss/vim-floaterm'
Plug 'scrooloose/nerdcommenter'

" Quick run
Plug 'thinca/vim-quickrun'
Plug 'is0n/jaq-nvim'

" Test runner
Plug 'vim-test/vim-test'


if has('nvim-0.5')
" LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
endif

" Treesitter
if has('nvim-0.7')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

" Filer
Plug 'scrooloose/nerdtree'


" Color Schema
Plug 'KeitaNakamura/neodark.vim'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'


" Lint
if !has('nvim-0.7')
  Plug 'w0rp/ale'
endif


" Syntax Highlight
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'
Plug 'cespare/vim-toml'
Plug 'othree/yajs.vim'
Plug 'posva/vim-vue'
Plug 'dag/vim-fish'

" copilot
" Plug 'github/copilot.vim'

call plug#end()
