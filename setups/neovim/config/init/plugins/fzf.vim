if !has('nvim')
  " fzf.vim
  set runtimepath+=~/.fzf "fuzzy search

  function! FzfGhqWrapper()
    let root_path = system('ghq root')
    let repos = systemlist('ghq list --full-path')
    call fzf#run(fzf#wrap({
          \ 'source': repos,
          \ 'sink': 'lcd',
          \ 'options': '--prompt "Ghq> "'
          \}))
  endfunction

  nnoremap <Leader>ef :<C-u>Files<CR>
  nnoremap <Leader>em :<C-u>Maps<CR>
  nnoremap <Leader>eb :<C-u>Buffers<CR>
  nnoremap <Leader>eh :<C-u>History<CR>
  nnoremap <Leader>ag :<C-u>Ag<CR>
  nnoremap <Leader>cg :<C-u>call FzfGhqWrapper()<CR>
endif
