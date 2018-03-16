function! FindInc()
  let dirname=fnamemodify(expand("%:p"), ":h")
  let findRes=""
  let targetFile=b:IncSw
  for location in [dirname, '.' ]
    let cmd="find " . location . " -type f -iname " . targetFile . " -print -quit"
    let findRes=system(cmd)
    if filereadable(findRes)
      break
    endif
  endfor

  exe "e " findRes
endfun

function! CurtineIncSw()
  if exists("b:IncSw")
    e#
    return 0
  endif
  if match(expand("%"), '\.c') > 0
    let b:IncSw=substitute(expand("%:t"), '\.c\(.*\)', '.h*', "")
  elseif match(expand("%"), "\\.h") > 0
    let b:IncSw=substitute(expand("%:t"), '\.h\(.*\)', '.c*', "")
  endif

  call FindInc()
endfun

