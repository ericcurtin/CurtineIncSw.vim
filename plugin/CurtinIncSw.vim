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
    let cmd="find " . l:directory_name . " . -type f -iregex \""  . l:next_file . "\" -print -quit | head -n1 | tr -d '\n'"
    let l:result = system(cmd)

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
