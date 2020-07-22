" Vim syntaxtax file
" Language: Commodore 64 BASIC V2
" Maintainer: Thomas Knox
" Latest Revision: 21 July 2020

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "cbmbasic"

" Keywords
syntax keyword cbmBasicLanguageKeywords ABS AND ASC ATN CHR$ CLOSE
syntax keyword cbmBasicLanguageKeywords CLR CMD CONT COS DATA DEF
syntax keyword cbmBasicLanguageKeywords DIM END EXP FN FOR FRE
syntax keyword cbmBasicLanguageKeywords GET GOSUB GOTO IF INPUT
syntax keyword cbmBasicLanguageKeywords INT LEFT LEN LET LIST
syntax keyword cbmBasicLanguageKeywords LOAD LOG MID NEW NEXT NOT
syntax keyword cbmBasicLanguageKeywords ON OPEN OR PEEK POKE POS
syntax keyword cbmBasicLanguageKeywords PRINT READ RESTORE RETURN
syntax keyword cbmBasicLanguageKeywords RIGHT RND RUN SAVE SGN SIN
syntax keyword cbmBasicLanguageKeywords SPC SQR STATUS ST STEP STOP STR$
syntax keyword cbmBasicLanguageKeywords SYS TAB TAN THEN TIME TI TIME TI
syntax keyword cbmBasicLanguageKeywords TO USR VAL VERIFY WAIT

highlight link cbmBasicLanguageKeywords Keyword

syntax match cbmBasicComment "\vREM.*$"
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
