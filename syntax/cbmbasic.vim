" Vim syntax file
" Language:     Commodore BASIC V2 (C64, VIC-20, PET)
" Maintainer:   Thomas Knox
" Last Change:  2026 Nov 07
"
" Keywords are the BASIC V2 token table, $80 (END) through $CB (GO), plus
" the three reserved variables TI, TI$ and ST. Nothing else is a keyword in
" V2; see the note on cbmBasicNonV2 near the bottom.

if exists("b:current_syntax")
    finish
endif

syn case ignore

" $ and # are part of a keyword here: CHR$, LEFT$, TI$, PRINT#, INPUT#.
" Without this, none of them can match: a keyword rule only matches
" characters that are in 'iskeyword'. 'syn iskeyword' scopes
" the change to syntax matching and leaves 'w' motions alone.
if has('patch-7.4.1142')
    syn iskeyword @,48-57,_,35,36
else
    setlocal iskeyword+=35,36
endif

" ------------------------------------------------------------------ comments
" REM runs to end of line. Anchored on a word boundary: without it, REM
" matches inside FOREMAN and comments out the rest of the line.
syn match cbmBasicComment "\<REM\>.*$" contains=cbmBasicTodo
syn keyword cbmBasicTodo contained TODO FIXME XXX NOTE

" A shebang, for source run through petcat or a similar cross-development
" tool. Anchored to line 1 column 1, which is the only place it is valid.
syn match cbmBasicShebang "\%1l^#!.*$"

" ---------------------------------------------------------------- statements
syn keyword cbmBasicStatement CLOSE CLR CMD CONT DATA DEF DIM END GET
syn keyword cbmBasicStatement GOSUB GOTO INPUT LET LIST LOAD NEW ON OPEN
syn keyword cbmBasicStatement POKE PRINT READ RESTORE RETURN RUN SAVE STOP
syn keyword cbmBasicStatement SYS VERIFY WAIT

" GO is a separate token from GOTO, so GO TO is legal and must highlight.
syn keyword cbmBasicStatement GO

" The channel forms. These are two tokens in the tokeniser (PRINT then #)
" but are always written closed up, so they are matched as one word.
syn keyword cbmBasicStatement PRINT# INPUT# GET# CMD#

" ? is the standard abbreviation for PRINT and is what most listings use.
syn match cbmBasicStatement "?"

" -------------------------------------------------------------- control flow
syn keyword cbmBasicConditional IF THEN
syn keyword cbmBasicRepeat FOR TO STEP NEXT

" ----------------------------------------------------------------- functions
syn keyword cbmBasicFunction ABS ASC ATN CHR$ COS EXP FN FRE INT LEFT$ LEN
syn keyword cbmBasicFunction LOG MID$ PEEK POS RIGHT$ RND SGN SIN SPC SQR
syn keyword cbmBasicFunction STR$ TAB TAN USR VAL

" ----------------------------------------------------------------- operators
syn keyword cbmBasicOperator AND OR NOT
" ^ is exponentiation. On a real machine this key is the up-arrow.
syn match cbmBasicOperator "[-+*/^=<>]"
syn match cbmBasicOperator "<>"
syn match cbmBasicOperator "[<>]="

" -------------------------------------------------------- reserved variables
syn keyword cbmBasicReserved TI TI$ ST

" Not BASIC V2. TIME, TIME$ and STATUS are the long forms from BASIC 3.5 and
" 7.0; on a stock C64 they parse as TI + ME, TI$ + ME and ST + ATUS. Some
" cross-compilers accept them, so they are kept in their own group. Link it
" to Error if you only ever target V2, or clear it to ignore them entirely.
syn keyword cbmBasicNonV2 TIME TIME$ STATUS

" ------------------------------------------------------------------- strings
" A closing quote is optional at end of line in Commodore BASIC:
"   10 PRINT "HELLO
" is perfectly legal. Without 'oneline' that unterminated string swallows
" the rest of the file. The second end pattern, +$+, is what makes the
" unterminated form match at all: with only a closing quote to end on, the
" region fails and the string gets no highlighting whatsoever.
" There are no backslash escapes, so nothing to skip.
syn region cbmBasicString start=+"+ end=+"+ end=+$+ oneline contains=cbmBasicCtrlCode

" Control code escapes as written by petcat, CBM prg Studio and friends:
" {clr}, {down}, {rvs on}, {red}, {2 spaces} and so on.
syn match cbmBasicCtrlCode contained +{[^}"]*}+

" ------------------------------------------------------------------- numbers
" V2 has no hex or binary literals. Floats may carry an exponent, and the
" leading digit is optional.
syn match cbmBasicNumber "\<\d\+\>"
syn match cbmBasicNumber "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\="
syn match cbmBasicNumber "\.\d\+\%([eE][-+]\=\d\+\)\=\>"
syn match cbmBasicNumber "\<\d\+[eE][-+]\=\d\+\>"

" A file or device number after a channel keyword or a comma.
syn match cbmBasicFilenumber "#\d\+"

" -------------------------------------------------------------- line numbers
" Every statement line starts with one, and telling them apart from ordinary
" numeric literals is the single most useful thing to colour in a listing.
" Defined after cbmBasicNumber so it wins where both start at the same column.
syn match cbmBasicLineNumber "^\s*\d\+\>"

" A line number used as a jump target reads better as a label than as a
" number, so GOTO 100 and THEN 100 pick up their own group.
" This has to be a lookbehind, not \zs: a match that *starts* on the keyword
" never gets a chance, because a syn keyword always outranks a syn match at
" the same position. The engine would take the keyword and advance past it.
syn match cbmBasicLineRef "\%(\<\%(GOTO\|GOSUB\|THEN\|GO\s\+TO\)\s*\)\@<=\d\+\%(\s*,\s*\d\+\)*"

" --------------------------------------------------------------------- sync
syn sync minlines=1 maxlines=2

" ---------------------------------------------------------------- highlight
" 'hi def link' rather than 'hi link': the def form lets a colorscheme or a
" user override win. The previous version used the undefaulted form, which
" cannot be overridden.
hi def link cbmBasicComment     Comment
hi def link cbmBasicTodo        Todo
hi def link cbmBasicShebang     PreProc
hi def link cbmBasicStatement   Statement
hi def link cbmBasicConditional Conditional
hi def link cbmBasicRepeat      Repeat
hi def link cbmBasicFunction    Function
hi def link cbmBasicOperator    Operator
hi def link cbmBasicReserved    Identifier
hi def link cbmBasicNonV2       Special
hi def link cbmBasicString      String
hi def link cbmBasicCtrlCode    SpecialChar
hi def link cbmBasicNumber      Number
hi def link cbmBasicFilenumber  Number
hi def link cbmBasicLineNumber  LineNr
hi def link cbmBasicLineRef     Label

" Must be set last. The previous version set it on line 10, before defining
" any rules, which defeats the guard at the top of this file.
let b:current_syntax = "cbmbasic"
