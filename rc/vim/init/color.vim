try
  colorscheme gruvbox
  set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

let g:rehash256 = 1

augroup MyColorScheme
  autocmd!
  autocmd ColorScheme * highlight MatchParen gui=bold,underline guibg=#3D3469 guifg=NONE
augroup END
