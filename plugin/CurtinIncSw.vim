function! FindInc(inc_sw)
  let dirname=fnamemodify(expand("%:p"), ":h")
  let target_file=a:inc_sw
  let cmd="find " . dirname . " . -type f -iname \"" . target_file . "\" -print -quit"
  let b:find_res=system(cmd)
endfun

function! CurtineIncSw()

  " not found previously
  if exists("b:find_res") == 0
    if match(expand("%"), '\.c') > 0
      let inc_sw=substitute(expand("%:t"), '\.c\(.*\)', '.h*', "")
      call FindInc(inc_sw)
    elseif match(expand("%"), "\\.h") > 0
      let inc_sw=substitute(expand("%:t"), '\.h\(.*\)', '.c*', "")
      call FindInc(inc_sw)
    else
      return 0
    endif
  endif

  " open the matched file
  exe "e " b:find_res

endfun

