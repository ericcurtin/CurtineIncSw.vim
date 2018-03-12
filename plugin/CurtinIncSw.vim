function! FindInc()
  let dirname=fnamemodify(expand("%:p"), ":h")
  let findRes=""
  let targetFile=t:IncSw
  for location in [dirname, '.' ]
    let cmd="find " . location . " -type f -iname " . targetFile . " -print -quit | tr -d '\n'"
    let findRes=system(cmd)
    if filereadable(findRes)
      break
    endif
  endfor

  exe "e " findRes
endfun

function! CurtineIncSw()
  if match(expand("%"), '\.c') > 0
    let t:IncSw=substitute(expand("%:t"), '\.c\(.*\)', '.h*', "")
  elseif match(expand("%"), "\\.h") > 0
    let t:IncSw=substitute(expand("%:t"), '\.h\(.*\)', '.c*', "")
  endif

  call FindInc()
endfun

