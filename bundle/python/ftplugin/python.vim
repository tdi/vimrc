setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab
setlocal expandtab
setlocal ai 
let python_highlight_all = 0
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"set omnifunc=pythoncomplete#Complete
set formatoptions=cq foldignore= wildignore+=*.py[co]
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
let g:jedi#auto_clone_doc=1
let g:jedi#popup_on_dot=0

