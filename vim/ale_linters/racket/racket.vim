" Author: Yuta Nakamura - https://github.com/bonyuta0204
" Description: Lints racket files

function! ale_linters#racket#racket#Handle(buffer, lines) abort
  "Eroor message Example
  "test.rkt:46:0: read-syntax: expected a `)` to close `(`
  "    possible cause: indentation suggests a missing `)` before line 47
  "    context...:
  "    read-one/not-eof
  "    loop
  "    [repeats 4 more times]
  "    read-unwrapped-sequence17
  "    read-undotted
  "    read-syntax
  "    /usr/share/racket/collects/syntax/module-reader.rkt:190:25: loop
  "    /usr/share/racket/collects/syntax/module-reader.rkt:183:2: wrap-inter
  "    /usr/share/racket/collects/racket/../syntax/module-reader.rkt:65:9: l
  "    read-extension44
  "    read-syntax
  "    default-load-handler
  "    standard-module-name-resolver
  "    module-path-index-resolve
  "    [repeats 1 more time]
  "    module-declared?
  "     look for error lines first.
  let l:pattern = '^\f\+:\([0-9]\+\):\([0-9]\+\):\s\(.\+\)'
  let l:output = []
  let l:column_offset = 0
  let l:last_line_with_message = ''

  for l:line in a:lines
    let l:match = matchlist(l:line, l:pattern)

    if !empty(l:match)
      let l:text = l:match[0]
      call add(l:output, {
            \  'col': str2nr(l:match[2]),
            \  'lnum': str2nr(l:match[1]),
            \  'text': l:text,
            \})
    endif
  endfor

  echo l:output
  return l:output
endfunction

call ale#linter#Define('racket', {
      \   'name': 'racket',
      \   'output_stream': 'stderr',
      \   'executable': 'racket',
      \   'command': 'racket %s',
      \   'callback': 'ale_linters#racket#racket#Handle',
      \})
