" Terminal Mode Settings
  augroup MyTerminal
    autocmd BufEnter,BufWinEnter * if &buftype ==# "terminal" | normal i
  augroup END

" Help settings
augroup Help
  autocmd!
  autocmd FileType help,man call InitHelp()
  autocmd BufEnter,WinEnter * if &filetype ==# 'help'| call InitHelp()
  autocmd BufEnter,WinEnter * if &filetype ==# 'man'| call InitHelp()
augroup End

function! InitHelp ()
  wincmd H
  vertical resize 80
endfunction
