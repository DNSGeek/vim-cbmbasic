" Vim syntaxtax file
" Language: Commodore 64 BASIC V2
" Maintainer: Thomas Knox
" Latest Revision: 04 Jan 2023

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "cbmbasic"

" Keywords
syntax keyword cbmBasicLanguageKeywords ABS AND ASC ATN CHR$ CLOSE
syntax keyword cbmBasicLanguageKeywords CLR CMD CONT COS DATA DEF
syntax keyword cbmBasicLanguageKeywords DIM END EXP FN FOR FRE
syntax keyword cbmBasicLanguageKeywords GET GET# GOSUB GOTO IF INPUT
syntax keyword cbmBasicLanguageKeywords INPUT# INT LEFT$ LEN LET LIST
syntax keyword cbmBasicLanguageKeywords LOAD LOG MID$ NEW NEXT NOT
syntax keyword cbmBasicLanguageKeywords ON OPEN OR PEEK POKE POS
syntax keyword cbmBasicLanguageKeywords PRINT PRINT# READ RESTORE RETURN
syntax keyword cbmBasicLanguageKeywords RIGHT$ RND RUN SAVE SGN SIN
syntax keyword cbmBasicLanguageKeywords SPC SQR ST STATUS STEP STOP STR$
syntax keyword cbmBasicLanguageKeywords SYS TAB TAN THEN TI TIME TI$ TIME$
syntax keyword cbmBasicLanguageKeywords TO USR VAL VERIFY WAIT
syntax keyword cbmBasicLanguageKeywords abs and asc atn chr$ close
syntax keyword cbmBasicLanguageKeywords clr cmd cont cos data def
syntax keyword cbmBasicLanguageKeywords dim end exp fn for fre
syntax keyword cbmBasicLanguageKeywords get get# gosub goto if input
syntax keyword cbmBasicLanguageKeywords input# int left$ len let list
syntax keyword cbmBasicLanguageKeywords load log mid$ new next not
syntax keyword cbmBasicLanguageKeywords on open or peek poke pos
syntax keyword cbmBasicLanguageKeywords print print# read restore return
syntax keyword cbmBasicLanguageKeywords right$ rnd run save sgn sin
syntax keyword cbmBasicLanguageKeywords spc sqr st status step stop str$
syntax keyword cbmBasicLanguageKeywords sys tab tan then ti time ti$ time$
syntax keyword cbmBasicLanguageKeywords to usr val verify wait

highlight link cbmBasicLanguageKeywords Keyword

syntax match cbmBasicComment "\vREM.*$"
syntax match cbmBasicComment "\vrem.*$"
syntax match cbmBasicComment "\v\#\!.*$"
highlight link cbmBasicComment Comment

syntax match cbmBasicOperator "\v\*"
syntax match cbmBasicOperator "\v/"
syntax match cbmBasicOperator "\v\+"
syntax match cbmBasicOperator "\v-"
syntax match cbmBasicOperator "\v\="
highlight link cbmBasicOperator Operator

syntax region cbmBasicString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link cbmBasicString String

syntax match cbmBasicNumber "\v<\d+>"
syntax match cbmBasicNumber "\v<\d+\.\d+>"
highlight link cbmBasicNumber Number
