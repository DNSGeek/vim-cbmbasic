" Vim filetype detection
" Language: Commodore BASIC V2
"
" .bas is shared with every other BASIC dialect. If you also have plugins for
" MMBasic, FreeBASIC or MachiKania installed, whichever ftdetect loads first
" wins, because :setfiletype does not overwrite a filetype that is already
" set. To make the choice explicit rather than load-order dependent:
"
"     let g:cbmbasic_claim_bas = 1
"
" It is off by default. .c64, .cbm and .petcat are unambiguous; .bas is not.

augroup cbmbasic
    autocmd!
    autocmd BufNewFile,BufRead *.c64    setfiletype cbmbasic
    autocmd BufNewFile,BufRead *.cbm    setfiletype cbmbasic
    autocmd BufNewFile,BufRead *.petcat setfiletype cbmbasic

    if get(g:, 'cbmbasic_claim_bas', 0)
        autocmd BufNewFile,BufRead *.bas setfiletype cbmbasic
    endif

    " A file whose first line is a line number followed by a keyword is a
    " BASIC listing whatever it is called. This catches .txt and .lst dumps
    " from petcat without claiming those extensions outright.
    autocmd BufNewFile,BufRead *.txt,*.lst
        \ if getline(1) =~? '^\s*\d\+\s\+\(rem\|print\|poke\|for\|if\|open\|sys\)\>' |
        \   setfiletype cbmbasic |
        \ endif
augroup END
