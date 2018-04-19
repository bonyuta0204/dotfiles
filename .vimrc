
"
""""""""""""""""""""""""""""""
" Basic Configuration
""""""""""""""""""""""""""""""
" {{{

set nocompatible
filetype indent plugin on 

syntax on

filetype indent plugin on 
set hidden
set wildmenu
set showcmd
set hlsearch
set backspace=indent,start,eol
set autoindent
set ruler
set shiftwidth=4
set tabstop=4
set laststatus=2

set confirm
set list

set listchars=tab:>-,trail:-,nbsp:%,eol:$

set visualbell
set t_vb=
set cmdheight=2
set number
" 　邪魔なフォルダの保存先を変更する
set backupdir=~/.vim/temp/
set directory=~/.vim/temp/
set viminfo+=n~/.vim/temp/
set undodir=~/.vim/temp/
" 文字コードの設定
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" use OS clipboard
set clipboard=unnamed

set colorcolumn=80      " その代わり80文字目にラインを入れる
" ステータスラインの色を変える
set laststatus=2 

au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=bold,reverse
			 \ guisp=Magenta guibg=#FFFFFF guifg=#84B97C
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold 
			  \ guibg=#639EE4 guifg=#FFFFFF
" }}}

""""""""""""""""""""""""""""""
" NeoBundleの設定
""""""""""""""""""""""""""""""
"{{{
if has('vim_starting')
		set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ここに入れたいプラグインを記入

" MarkDown用のプラグインたち
NeoBundle "plasticboy/vim-markdown"
NeoBundle "kannokanno/previm"
NeoBundle "tyru/open-browser.vim"
" ファイル管理プラグイン
NeoBundle "Shougo/unite.vim"
NeoBundle "scrooloose/nerdtree"
" NeoBundle "Shougo/vimproc"

NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\     'windows' : 'tools\\update-dll-mingw',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make',
			\     'linux' : 'make',
			\     'unix' : 'gmake',
			\    },
			\ }
NeoBundle 'Shougo/neomru.vim'

" ColorSchemeのプラグイン
NeoBundle "KeitaNakamura/neodark.vim"
NeoBundle "tomasr/molokai"
NeoBundle "fuenor/im_control.vim"

" VimShell
NeoBundle "Shougo/vimshell"
if has('lua')
" 入力補完
NeoBundle 'Shougo/neocomplete.vim'
endif
" 入力補完
NeoBundle 'Shougo/neocomplcache'

" html 関係
NeoBundle 'mattn/emmet-vim'
NeoBundle 'taichouchou2/surround.vim'

" surround vim 
NeoBundle 'tpope/vim-surround'

"quickrun
NeoBundle 'thinca/vim-quickrun'

" ruby
NeoBundle 'tpope/vim-rails'

call neobundle#end()
 
"}}}

"NeoBundleここまで

""""""""""""""""""""""""""""""
" quickrunの設定
""""""""""""""""""""""""""""""
"{{{
nmap <Leader>r <Plug>(quickrun)
let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
  let g:quickrun_config = {
      \ "*": {"runner": "remote/vimproc"},
      \ }
endfunction

"}}}


" settings for emmet
"{{{
let g:user_emmet_leader_key='<c-t>'
"}}}

""""""""""""""""""""""""""""""
"キーマッピングの設定
""""""""""""""""""""""""""""""
"{{{
"<Leader>を<Space>に設定
let mapleader = " "

" jkでインkートモードを抜ける 
noremap! jk <Esc>
" 論理行ではなくて表示行で移動する
nnoremap j gj
nnoremap k gk

" rcで.vimrcを開く
nnoremap <Leader>rc :<C-u>edit $MYVIMRC<CR> 

" <F5>でvimrcを再読込
nnoremap <F5> :<C-u>source<Space>$MYVIMRC<CR>

"cmd でVimShellを起動
nnoremap cmd :<C-u>VimShell<CR> 
""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
""""""""""""""""""""""""""""""
" <Leader>hjkl でWindowの移動
""""""""""""""""""""""""""""""
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" <Leader>HJKL でWindowを移動
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
nnoremap<Leader>H <C-w>H
nnoremap<Leader>J <C-w>J
nnoremap<Leader>K <C-w>K
nnoremap<Leader>L <C-w>L

"split of window
nnoremap <Leader>s :<C-u>split<CR><C-w>j
nnoremap <Leader>v :<C-u>vsplit<CR><C-w>l
" create new line at the bottom of the file and go into insert line
nnoremap <Leader>o Go 

" disable arrow keys(for practice)
noremap <LEFT> <Nop>
noremap <RIGHT> <Nop>
noremap <UP> <Nop>
noremap <DOWN> <Nop>

inoremap <LEFT> <Nop>
inoremap <RIGHT> <Nop>
inoremap <UP> <Nop>
inoremap <DOWN> <Nop>
" disable esc keys(practice)
inoremap <ESC> <Nop>

" jjで１マス先から入力開始
inoremap jj <RIGHT>

" dw で単語を削除, cwで単語を削除してInsert Modeに
" noremap dw diw
" noremap cw ciw
"
" key mapping for programming

inoremap += <space>+=<space>
inoremap -= <space>-=<space>
inoremap *= <space>*=<space>

"}}}

"キーマッピングの設定終わり

""""""""""""""""""""""""""""""
" colorscheme
""""""""""""""""""""""""""""""
"{{{
colorscheme neodark


"}}}


""""""""""""""""""""""""""""""
" Unite.vimの設定
""""""""""""""""""""""""""""""
" {{{
"キーマッピング

" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]

" 
nnoremap [unite]u :<C-u>Unite<space>
nnoremap <silent> [unite]f :<C-u>Unite<space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<space>buffer<CR>
nnoremap <silent> [unite]h :<C-u>Unite<space>file_mru<CR>
nnoremap <silent> [unite]a :<C-u>Unite<space>file<space>buffer<space>bookmark<space>file_mru<CR>

" }}}
"
""""""""""""""""""""""""""""""
" NeoCompleteCache の設定
""""""""""""""""""""""""""""""
" {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
						\ 'default' : ''
						\ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
		return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" }}}

if has('lua')
""""""""""""""""""""""""""""""
" NeoComplete の設定
""""""""""""""""""""""""""""""
" {{{
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}
endif 

""""""""""""""""""""""""""""""
" VimScript の設定
""""""""""""""""""""""""""""""
" Vimscript file settings-------------------- {{{
augroup filetype_vim
		autocmd!
		autocmd FileType vim setlocal foldmethod=marker
		autocmd FileType vim inoremap <buffer> " "
		autocmd FileType vim inoremap <buffer> < <><LEFT>
augroup END
" }}}

""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""
"Markdown settings ----------------------{{{

" disable autoindent of vim-markdown plugin
let g:vim_markdown_new_list_item_indent = 0
augroup markdown 
		autocmd!
		autocmd FileType markdown inoremap <buffer> * **
		autocmd FileType markdown inoremap <buffer> ** ****<Left><Left>
		autocmd Filetype markdown inoremap <buffer> <S-cr> <space><space><CR>
		autocmd FileType markdown PrevimOpen
augroup END	

"}}} 


""""""""""""""""""""""""""""""
" Python settings
""""""""""""""""""""""""""""""
" {{{
augroup python
		autocmd!
		autocmd Filetype python inoremap <buffer> __ ____<LEFT><LEFT>
		autocmd FileType python inoremap <buffer> """
		\ """"""<LEFT><LEFT><LEFT><CR><ESC>O
		autocmd FileType python inoremap<buffer> == <space>==<space>
		autocmd FileType python inoremap <buffer> , ,<space>

		autocmd FileType python setlocal foldmethod=indent 
		autocmd Filetype python setlocal expandtab
		autocmd FileType python setlocal foldlevel=99
"}}}	

""""""""""""""""""""""""""""""
" Ruby settings
""""""""""""""""""""""""""""""
" {{{
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

augroup ruby
		autocmd!
		autocmd Filetype ruby inoremap <buffer> <% <% %><LEFT><LEFT>
		autocmd Filetype ruby inoremap <buffer> <space>
		autocmd Filetype ruby inoremap <buffer> , ,<space>
		autocmd Filetype ruby setlocal foldmethod=indent 
		autocmd Filetype ruby setlocal expandtab
		autocmd Filetype ruby setlocal foldlevel=99
"}}}	
""""""""""""""""""""""""""""""
" Erb settings
""""""""""""""""""""""""""""""
" {{{
augroup eruby
		autocmd!
		autocmd Filetype eruby.html inoremap <buffer> <% <% %><LEFT><LEFT><LEFT>

		autocmd FileType python setlocal foldmethod=indent 
		autocmd Filetype python setlocal expandtab
		autocmd FileType python setlocal foldlevel=99
"}}}	
""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
" {{{ 
"NERDTree
"}}}



filetype indent plugin on 
"html settings
"{{{
augroup html

	autocmd!
	autocmd FileType html inoremap <buffer> < <><Left>
"}}}
