" Vim syntax file
" Language:     XFST LexC transducer description
" Maintainers:  Jonathan Washington; Flammie Pirinen <flammie@iki.fi>
" Contributors: Mansur Saykhunov <tatcorpus@gmail.com>; Brendan Malloy bbqsrc; Olexiy Savenkov
" Last Change:  2019-11-19
" Version:      0.50
" URL: 
" See http://wiki.apertium.org/wiki/Apertium-specific_conventions_for_lexc
" for more information about this dialect of lexc

" Quit when a (custom) syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'lexc'
endif

syn sync clear
syn case match

" Keywords
syn keyword lexcKeyWords              Definitions Declarations
syn keyword lexcKeyWordErrors         multichar_symbols Multichar_symbols Lexicon lexicon
syn keyword lexcLabel                 Multichar_Symbols
syn region  lexcLexicon               start="LEXICON" end="LEXICON" fold
syn match   lexcLexiconLine           "LEXICON .*$" contains=lexcLexiconKeyword,lexcLexiconB
syn keyword lexcLexiconKeyword        LEXICON contained
syn match   lexcLexiconB              "[a-zA-ZА-ЯӐ-ӲҪÁ-Úá-ú_\-][a-zA-ZА-ЯӐ-ӲҪÁ-Úá-ú0-9_\-]*" contained
syn match   lexcLexiconB              "[\#\_]"
 
" Identifiers
syn match   lexcFlagDiacritic         "@[^@][^@]*@"
 
" Symbols
syn match   lexcSymbol                +\\["'\\]+ contained
syn match   lexcSymbol                "[\:]"
 
 
" Operators
syn match   lexcOperator              "[\.\*\+\?|\\\^]"
syn match   lexcEscapedChar           "%."
syn match   lexcApertiumMorphBoundary "%>"

" Comments
syn keyword lexcTodo                  TODO FIXME CHECK NOTE BUG XXX contained
syn match   lexcApertiumSpecial       "Dir\/[LR][LR]" contained
syn match   lexcApertiumSpecial       "Use\/MT" contained
syn match   lexcCommentInfos          /@\w\+/ contained
syn match   lexcComment               "\!.*$" contains=lexcApertiumSpecial,lexcTodo,lexcCommentInfos

" More Identifiers
" This stuff needs to come after the lexcEscapedChar
syn match   lexcApertiumLeftBrackets  "%[{<\[]"
syn match   lexcApertiumRightBrackets "%[}>\]]"
syn match   lexcApertiumMC            "%[<{\[].\{-}%[>}\]]"hs=s+2,he=e-2 contains=lexcApertiumLeftBrackets,lexcApertiumRightBrackets
syn match   lexcSection               "^!\{3,\}\s\+.*\s\+!\{3,\}"
 
hi def link lexcKeyWords              Keyword
hi def link lexcWordErrors            Error
hi def link lexcLabel                 Label
hi def link lexcLexiconKeyword        Statement
hi def link lexcLexiconLine           Label
hi def link lexcLexiconB              Function
hi def link lexcComment               Comment
hi def link lexcOperator              Operator
hi def link lexcFlagDiacritic         Identifier
hi def link lexcString                String
hi def link lexcSymbol                Character
hi def link lexcTodo                  Todo
hi def link lexcPointer               Operator
hi def link lexcEscapedChar           Delimiter
hi def link lexcCommentInfos          SpecialComment

" Apertium-specific stuff
hi def link lexcApertiumMorphBoundary String
hi def link lexcApertiumSpecial       PreCondit
hi def link lexcApertiumLeftBrackets  Delimiter
hi def link lexcApertiumRightBrackets Delimiter
hi def link lexcApertiumMC            Label
hi def link lexcSection               Section

setlocal foldmethod=expr 
setlocal foldexpr=getline(v:lnum)=~'^[^!]*LEXICON'\|\|getline(v:lnum)=~'^[^!]*Multichar_Symbols'?'>1':'='

let b:current_syntax = "lexc"

if main_syntax == 'lexc'
  unlet main_syntax
endif

" vim: ts=8
