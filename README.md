# CurtineIncSw.vim
Switch from \*.c\* to \*.h\* and vice versa

## description
Some assumpions: 

  filename for header and implementation is identical excluding the directory 
    and extension (foo.c -> foo.h supported, foo.c -> bar.h not supported) 
  user opens files from base of repo 
  repo contains both implementation and header files 

Based on these assumptions, you don't need to reconfigure when you switch 
between repos, provided the headers and implementation are all in the same repo. 

https://github.com/ericcurtin/CurtineIncSw.vim 
 
## install details
Copy CurtineIncSw.vim into your ~/.vim/plugin directory. Or :source CurtineIncSw.vim. 

You can set a keyboard shortcut if you want by placing something like: 

  map <F5> :call CurtineIncSw()<CR> 

in your .vimrc 
