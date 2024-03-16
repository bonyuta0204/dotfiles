""""""""""""""""""""""""""""""
"キーマッピングの設定
""""""""""""""""""""""""""""""
" デフォルト書き換え系
let mapleader = " " "<Leader>を<Space>に設定
noremap! jk <Esc>
nnoremap j gj
nnoremap k gk
inoremap jj <RIGHT>
nnoremap <C-]> g<C-]>
tnoremap jk <C-\><C-n>


" ファイル開く系ショートカット
nnoremap <Leader>rc :<C-u>edit $MYVIMRC<CR>
nnoremap <F5> :<C-u>source<Space>$MYVIMRC<CR>
nnoremap <C-n> :<C-u>NERDTreeToggle<CR>
nnoremap <C-e> :<C-u>Explore<CR>
nmap <C-m> :<C-u>TagbarToggle<CR>



" 括弧補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>


" Window関連
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap<Leader>H <C-w>H
nnoremap<Leader>J <C-w>J
nnoremap<Leader>K <C-w>K
nnoremap<Leader>L <C-w>L

"split of window
nnoremap <Leader>s :<C-u>split<CR><C-w>j
nnoremap <Leader>v :<C-u>vsplit<CR><C-w>l
