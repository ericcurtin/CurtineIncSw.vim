" Search for alternative_filename_regex in the dir of the current file
" if found, returns v:true and sets b:inc_sw to the full path
function! FindInc(alternative_filename_regex)
  let dirname=fnamemodify(expand("%:p"), ":h")
  let target_file=a:alternative_filename_regex
  " At this point cmd might evaluate to something of the format:
  " find /Users/person/ . -type f -iregex ".*\/test_class.h[a-z]*" -print -quit
  let cmd="find " . dirname . " . -type f -iregex \""  . target_file . "\" -print -quit"
  let find_res=systemlist(cmd)
  if len(find_res) == 0
    return v:false
  endif
  let first_result=find_res[0]
  if filereadable(first_result)
    " Found a result matching the regex
    let b:inc_sw=first_result
    return v:true
  endif
  return v:false
endfun

" If a header or body is open, open the other one if found
" returns v:true on success,
" otherwise returns v:false and does nothing
function! CurtineIncSw()
  if exists("b:inc_sw") && filereadable(b:inc_sw)
    " Use cached filename of alternative
    execute "e " .. b:inc_sw
    return v:true
  endif

  let alternative = v:null
  if match(expand("%"), '\.c') > 0
    let alternative = substitute(".*\\\/" . expand("%:t"), '\.c\(.*\)', '.h[a-z]*', "")
  elseif match(expand("%"), "\\.h") > 0
    let alternative = substitute(".*\\\/" . expand("%:t"), '\.h\(.*\)', '.c[a-z]*', "")
  elseif match(expand("%"), '\.ads') > 0
    let alternative = substitute(".*\\\/" . expand("%:t"), '\.ads\(.*\)', '.adb', "")
  elseif match(expand("%"), "\\.adb") > 0
    let alternative = substitute(".*\\\/" . expand("%:t"), '\.adb\(.*\)', '.ads', "")
  endif

  if alternative is v:null
    " there is no alternative for this kind of file
    return v:false
  endif

  let success = FindInc(alternative)
  if success
    execute "e " .. b:inc_sw
    return v:true
  endif
  return v:false
endfun

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

