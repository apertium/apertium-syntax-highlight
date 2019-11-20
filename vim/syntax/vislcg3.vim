" Vim syntax file
" Language:     VISL CG-3 natural language constraint grammar
" Maintainer:   Flammie Pirinen <flammie@iki.fi>
" Contributors: Mansur Saykhunov <tatcorpus@gmail.com>
" Last Change:  2019-11-19
" Version:      0.50
" URL: http://iki.fi/~flammie

" Quit when a (custom) syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'vislcg3'
endif

syn sync clear
syn case match

" Internal keywords
syn keyword vislcg3KeyWords     ADD ADDCOHORT ADDRELATION ADDRELATIONS AFTER-SECTIONS ALL AND APPEND BARRIER BEFORE-SECTIONS CBARRIER CONSTRAINTS COPY CORRECTIONS DELIMIT DELIMITERS END EXTERNAL IF IFF INCLUDE LINK LIST MAP MAPPINGS MAPPING-PREFIX MOVE NEGATE NONE NOT NULL-SECTION OPTIONS PREFERRED-TARGETS REMCOHORT REMOVE REMRELATION REMRELATIONS REPLACE SECTION SELECT SET SETCHILD SETPARENT SETRELATION SETRELATIONS SETS SOFT-DELIMITERS STATIC-SETS STRICT-TAGS SUBSTITUTE SWITCH TARGET TEMPLATE TO UNMAP OR
syn match   vislcg3Operators    /[-|+^∩∆]/
syn match   vislcg3Operators    /[*+0-9-]\+/

" some fragments
"syn match   vislcg3Id           /\i*/
syn match   vislcg3Form         /"<[^>]*>"/ contained
syn match   vislcg3Word         /"[^"@]"/ contained
syn match   vislcg3SynTags      /@\w\+/
syn region  vislcg3Bracketed    start=/(/ end=/)/ contains=vislcg3Form,vislcg3Word,vislcg3Id,vislcg3Operators,vislcg3SynTags

" Comments
syn keyword vislcg3CommentNotes TODO FIXME CHECK NOTE BUG XXX contained 
syn match   vislcg3CommentInfos /@\w\+/ contained
syn match   vislcg3Comment      /#.*/ contains=vislcg3CommentNotes,vislcg3CommentInfos

" Highlights
hi def link vislcg3KeyWords     Keyword
hi def link vislcg3Form         String
hi def link vislcg3Word         Character
hi def link vislcg3SynTags      Function
hi def link vislcg3Id           Identifier
hi def link vislcg3Operators    SpecialChar
hi def link vislcg3CommentInfos SpecialComment
hi def link vislcg3CommentNotes Todo
hi def link vislcg3Comment      Comment

let b:current_syntax = "vislcg3"

if main_syntax == 'vislcg3'
  unlet main_syntax
endif

" vim: ts=8
