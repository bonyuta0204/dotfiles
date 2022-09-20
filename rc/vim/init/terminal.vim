highlight BlackBg guibg=black guifg=white
if has('nvim')
  augroup TermColor
    autocmd!
    autocmd TermOpen * :set winhighlight=Normal:BlackBg
    autocmd TermOpen * :setlocal nonumber
    autocmd BufHidden term://* :set winhighlight=Normal:Normal
  augroup END
endif

" open terminal in another window
function! OpenTerminal() abort
  let s:fish_path = exepath('fish')
  if !empty(s:fish_path)
    execute "vsplit " . "term://" . s:fish_path
  else
    vsplit +terminal
  endif
endfunction

nnoremap <Leader>sh :<C-u>call OpenTerminal()<CR>
