" Vim syntax file
" Language:     VISL CG-3 natural language constraint grammar
" Maintainer:   Flammie Pirinen <flammie@iki.fi>
" Contributors: Mansur Saykhunov <tatcorpus@gmail.com>
" Last Change:  2019-11-20
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
syn match   vislcg3Operators    /[-|+^∩∆]/

" Word
syn match   vislcg3Wordform     /^"<.*>"/

" Readings
syn match   vislcg3Lemma        /\t"[^"]*"/ contained
syn match   vislcg3Delims       /[:/]/ contained
syn match   vislcg3Tags         / <[^>]\+>/ contained
syn match   vislcg3MetaTags     /:[^ :]\+:/ contained
syn match   vislcg3SynTags      /@[^ ]\+/ contained
"syn match   vislcg3TraceTags    / [A-Z][A-Z_-]*\+:[0-9]\+/ contained
syn match   vislcg3TraceTags    / (ADD:[0-9]\+\|ADDCOHORT:[0-9]\+\|ADDRELATION:[0-9]\+\|ADDRELATIONS:[0-9]\+\|AFTER\-SECTIONS:[0-9]\+\|ALL:[0-9]\+\|AND:[0-9]\+\|APPEND:[0-9]\+\|BARRIER:[0-9]\+\|BEFORE\-SECTIONS:[0-9]\+\|CBARRIER:[0-9]\+\|CONSTRAINTS:[0-9]\+\|COPY:[0-9]\+\|CORRECTIONS:[0-9]\+\|DELIMIT:[0-9]\+\|DELIMITERS:[0-9]\+\|END:[0-9]\+\|EXTERNAL:[0-9]\+\|IF:[0-9]\+\|IFF:[0-9]\+\|INCLUDE:[0-9]\+\|LINK:[0-9]\+\|LIST:[0-9]\+\|MAP:[0-9]\+\|MAPPINGS:[0-9]\+\|MAPPING\-PREFIX:[0-9]\+\|MOVE:[0-9]\+\|NEGATE:[0-9]\+\|NONE:[0-9]\+\|NOT:[0-9]\+\|NULL\-SECTION:[0-9]\+\|OPTIONS:[0-9]\+\|PREFERRED\-TARGETS:[0-9]\+\|REMCOHORT:[0-9]\+\|REMOVE:[0-9]\+\|REMRELATION:[0-9]\+\|REMRELATIONS:[0-9]\+\|REPLACE:[0-9]\+\|SECTION:[0-9]\+\|SELECT:[0-9]\+\|SET:[0-9]\+\|SETCHILD:[0-9]\+\|SETPARENT:[0-9]\+\|SETRELATION:[0-9]\+\|SETRELATIONS:[0-9]\+\|SETS:[0-9]\+\|SOFT\-DELIMITERS:[0-9]\+\|STATIC\-SETS:[0-9]\+\|STRICT\-TAGS:[0-9]\+\|SUBSTITUTE:[0-9]\+\|SWITCH:[0-9]\+\|TARGET:[0-9]\+\|TEMPLATE:[0-9]\+\|TO:[0-9]\+\|UNMAP:[0-9]\+\|OR):[0-9]\+/ contained
syn region  vislcg3Bracketed    start=/\t/ end=/$/ contains=vislcg3Lemma,vislcg3Delims,vislcg3Tags,vislcg3MetaTags,vislcg3SynTags,vislcg3TraceTags,vislcg3Operators

" Comments
syn keyword vislcg3CommentNotes TODO FIXME CHECK NOTE BUG XXX contained 
syn match   vislcg3CommentInfos /@\w\+/ contained
syn match   vislcg3Comment      /#.*/ contains=vislcg3CommentNotes,vislcg3CommentInfos

" Highlights
hi def link vislcg3KeyWords     Keyword
hi def link vislcg3Wordform     Label
hi def link vislcg3Lemma        Identifier
hi def link vislcg3Delims       String
hi def link vislcg3Tags         SpecialChar
hi def link vislcg3MetaTags     Comment
hi def link vislcg3SynTags      Identifier
hi def link vislcg3TraceTags    String
hi def link vislcg3LexiconName  Identifier
hi def link vislcg3Operators    SpecialChar
hi def link vislcg3CommentInfos SpecialComment
hi def link vislcg3CommentNotes Todo
hi def link vislcg3Comment      Comment

let b:current_syntax = "vislcg3"

if main_syntax == 'vislcg3'
  unlet main_syntax
endif

" vim: ts=8
