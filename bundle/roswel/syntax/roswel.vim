" Vim syntax file
" Language: ROsWeL 
" Maintainer: Dariusz Dwornikowski
" Latest Revision: 24 Jan 2013

function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

syn match roswelString '\".*\"'
syn region longcomment  start='\/\*' end='\*\/' 
call TextEnableCodeSnip('java', '`', '`', 'SpecialComment')
call TextEnableCodeSnip('java', '``', '``', 'SpecialComment')
syn match roswelVariable '\<\u\w*'
syn match functionCall '\<\l\w*'

syn keyword basicKeywords onGet onPost post get put onPut onHead head put option onOption
syn match basicOperator ';'
syn match basicOperator '>'
syn match basicOperator '\.'
syn match basicOperator ':'
syn match basicOperator '-'
syn match basicOperator '*'
syn match basicOperator '+'

if exists("b:current_syntax")
  finish
endif

hi def link basicKeywords Statement
hi def link basicOperator Operator
hi def link longcomment Comment
hi def link functionCall Constant
hi def link roswelString String
let b:current_syntax = "roswel"
