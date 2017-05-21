# CurtineIncSw.vim
Easily toggle between \*.c\* and \*.h\* buffers.

## Description
Some assumpions: 

* The filenames of the header and body (implementation) are identical
except for the extension or the directory.
  - That is, `foo.c` -> `foo.h` is supported, 
  - whereas  `foo.c` -> `bar.h` is not supported.
* The user opens files from the base of the repository.
* The repository contains both the header and body (implementation) files.

Based on these assumptions, you don't need to reconfigure when you switch 
between repositories, provided that the headers and bodies are all in the 
same repository.

## Installation
Copy `CurtineIncSw.vim` into your ~/.vim/plugin directory.
Or `:source CurtineIncSw.vim` to load it into your running session.

You can set a keyboard shortcut if you want by placing something like: 
```
  map \<F5\> :call CurtineIncSw()\<CR\>
```
in your `~/.vimrc` file.  Yes, the `<CR>` is literally there at the end
as the four characters shown.

### Installing with Vundle
Add `Plugin 'ericcurtin/CurtineIncSw.vim'` to your your plugin definitions
in your `.vimrc`

