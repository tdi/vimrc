setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab
setlocal expandtab
setlocal ai 
let python_highlight_all = 0
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set formatoptions=cq foldignore= wildignore+=*.py[co]
set completeopt=menuone,longest,preview
hi OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

