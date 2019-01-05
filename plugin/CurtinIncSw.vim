function! FindInc()
  let dirname=fnamemodify(expand("%:p"), ":h")
  let target_file=b:inc_sw
  let cmd="find " . dirname . " . -type f -iname \"" . target_file . "\" -print -quit"
  let b:find_res=system(cmd)
  if filereadable(b:find_res)
    return 0
  endif

  exe "e " b:find_res
endfun

function! CurtineIncSw()
  "if already found previously, directly open the matched file
  if exists("b:find_res")
     exe "e " b:find_res
  " otherwise try to find the matched file
  else
      if match(expand("%"), '\.c') > 0
        let b:inc_sw=substitute(expand("%:t"), '\.c\(.*\)', '.h*', "")
        call FindInc()
      elseif match(expand("%"), "\\.h") > 0
        let b:inc_sw=substitute(expand("%:t"), '\.h\(.*\)', '.c*', "")
        call FindInc()
      endif
  endif

endfun

