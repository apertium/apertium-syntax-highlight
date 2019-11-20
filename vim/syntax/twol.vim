" Vim syntax file
" Language:     XFST TWOL transducer description
" Maintainers:  Ondrej Dusek; Flammie Pirinen <tommi.pirinen@helsinki.fi>
" Contributors: Jonathan Washington; Mansur Saykhunov <tatcorpus@gmail.com>
" Last Change:  2019-11-19
" Version:      0.50
" URL: 

" Quit when a (custom) syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'twol'
endif

syn sync clear
syn case match

" Internal keywords
syn keyword twolTodo         TODO FIXME CHECK NOTE BUG XXX contained
syn match   twolCommentInfos /@\w\+/ contained
"syn keyword twolKeyWord      define clear push apply up read regex source contained
syn keyword twolKeyWord      Alphabet Diacritics Sets Definitions Rules where in matched

" Sets
syn match   twolSets         "^[A-Z][A-Za-z_-]*"


" Special characters
syn match   twolSpecChar     "\.#\."
syn match   twolSpecChar     "[?0:_]"
syn match   twolSpecChar     "\.\.\."

" Brackets
syn match   twolBracket      "\["
syn match   twolBracket      "\]"
syn match   twolBracket      "("
syn match   twolBracket      ")"

" Operators
syn match   twolOperator     "[+*~|&\\/,;<>]"
syn match   twolOperator     "(\?@\?<\?->\?@\?)\?"
syn match   twolOperator     "<\?=>\?"
syn match   twolOperator     "\.x\."
syn match   twolOperator     "\.o\."
syn keyword twolOperator     except where in matched
syn match   twolNorm         "%."

" Strings
syn match   twolString       "{[^}]*}"
syn match   twolNorm         "\"[^\"]*\""

" Identifier
syn region  twolRulename     start=/"/ end=/"/ oneline
"syn region twolRulename     "^\".*\"$"

" Section comments
syn match   twolSection      "^!\{3,\}[\s=]\+.*[\s=]\+!\{3,\}"

" Comments
syn match   twolComment     "^!.*" contains=twolTodo,twolCommentInfos,twolSection
syn match   twolComment     "\s!.*"ms=s+1 contains=twolTodo

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link twolComment     Comment
hi def link twolTodo        Todo
hi def link twolOperator    Special
hi def link twolBracket     Type
hi def link twolSpecChar    PreProc
hi def link twolKeyword     Keyword
hi def link twolNorm        Keyword
hi def link twolString      String
hi def link twolSection     Label
hi def link twolRulename    Identifier
hi def link twolSets        Type

let b:current_syntax = "twol"

if main_syntax == 'twol'
  unlet main_syntax
endif

" vim: ts=8
