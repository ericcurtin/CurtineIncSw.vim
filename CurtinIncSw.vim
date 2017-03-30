function! FindInc()
  let oldPath=&path
  set path=$PWD/**

  exe ":find " t:newIncSw

"Will do this just in time when needed
"  let t:newIncSw=expand('%:p')

  let &path=oldPath
endfun

function! CurtineIncSw()
  " Switch from *.c* to *.h* and vice versa

  if exists("t:oldIncSw") && expand("%:t:r") == fnamemodify(t:oldIncSw, ":t:r")
    let t:newIncSw=t:oldIncSw
    let t:oldIncSw=expand("%:p")
    exe "e " t:newIncSw
    return 0
  endif

  if match(expand("%"), '\.c') > 0
    let t:newIncSw=substitute(expand("%:t"), '\.c\(.*\)', '.h\1', "")
  elseif match(expand("%"), "\\.h") > 0
    let t:newIncSw=substitute(expand("%:t"), '\.h\(.*\)', '.c\1', "")
  endif

  call FindInc()
endfun
