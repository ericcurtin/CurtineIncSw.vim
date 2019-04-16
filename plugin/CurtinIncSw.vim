function! CurtineIncSw()
  if match(expand("%"), '\.c') > 0
    let l:next_file = substitute(".*\\\/" . expand("%:t"), '\.c\(.*\)', '.h[a-z]*', "")
  elseif match(expand("%"), "\\.h") > 0
    let l:next_file = substitute(".*\\\/" . expand("%:t"), '\.h\(.*\)', '.c[a-z]*', "")
  endif

  if exists("b:previous_file") && b:previous_file == l:next_file
    e#
  else
    let l:directory_name = fnamemodify(expand("%:p"), ":h")
    " At this point cmd might evaluate to something of the format:
    " /Users/person/ . -type f -iregex ".*\/test_class.h[a-z]*" -print -quit
    let l:cmd="find " . l:directory_name . " . -type f -iregex \""  . l:next_file . "\" -print -quit"

    " The substitute gets rid of the new line at the end of the result. The
    " function `filereadable` does not like the newline that `find` puts at
    " the end of the result and will not acknowledge that the file exists.
    let l:result = substitute(system(l:cmd), '\n', '', '')

    if filereadable(l:result)
      exe "e " l:result
    endif
  endif
endfun

function! GetCurrentFile()
  if exists("b:current_file")
    let b:previous_file = b:current_file
  endif

  if match(expand("%"), '\.c') > 0
    let b:current_file = substitute(".*\\\/" . expand("%:t"), '\.c\(.*\)', '.c[a-z]*', "")
  elseif match(expand("%"), "\\.h") > 0
    let b:current_file = substitute(".*\\\/" . expand("%:t"), '\.h\(.*\)', '.h[a-z]*', "")
  endif
endfun

augroup CurtineIncSwCurrentFile
  autocmd BufWinEnter * call GetCurrentFile()
augroup END
