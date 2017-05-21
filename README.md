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

## License

MIT License

  Copyright 2017 by Eric Curtin
  
  Permission is hereby granted, free of charge, to any person obtaining a 
  copy of this software and associated documentation files (the "Software"), 
  to deal in the Software without restriction, including without limitation 
  the rights to use, copy, modify, merge, publish, distribute, sublicense, 
  and/or sell copies of the Software, and to permit persons to whom the 
  Software is furnished to do so, subject to the following conditions:
  
  The above copyright notice and this permission notice shall be included 
  in all copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
  OTHER DEALINGS IN THE SOFTWARE.

