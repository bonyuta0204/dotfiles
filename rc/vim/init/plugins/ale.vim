let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 0
let g:ale_fixers = {
\ 'python': [
    \ 'autopep8',
    \ 'yapf',
    \ 'isort'
    \ ],
\ 'ruby': ['rubocop'],
\ 'javascript': [
    \ 'prettier',
    \ 'eslint'
    \ ],
\ 'typescript': [
    \ 'prettier',
    \ 'eslint'
    \ ],
\ 'vue': [
    \ 'prettier',
    \ 'eslint'
    \ ],
\ 'css': [
    \ 'prettier'
    \ ],
\ 'html': [
    \ 'remove_trailing_lines', 'trim_whitespace'
    \ ]
\ }

let g:ale_fix_on_save = 0
let g:ale_virtualenv_dir_names = []
nmap <F8> <Plug>(ale_fix)
