" Vim filetype plugin
" Language:   Commodore BASIC V2
" Maintainer: Thomas Knox

if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

setlocal comments=:REM
setlocal commentstring=REM\ %s

setlocal formatoptions-=t
setlocal formatoptions+=croql

" $ and # belong to a keyword, so * and w treat CHR$ and PRINT# as one word.
setlocal iskeyword=@,48-57,_,$,#

" A listing is one statement per numbered line. Wrapping or auto-indenting it
" would misrepresent the file, and there is no block structure to fold.
setlocal nowrap
setlocal noautoindent
setlocal nosmartindent
setlocal foldmethod=manual

" Real hardware truncates a logical line at 80 characters (two screen lines
" of 40). Show where that boundary falls rather than enforcing it.
setlocal colorcolumn=80

let b:undo_ftplugin =
    \ 'setlocal fo< com< cms< isk< wrap< ai< si< fdm< cc<'
