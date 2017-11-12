setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab
setlocal expandtab
setlocal ai 
let python_highlight_all=1
autocmd FileType python nnoremap <silent> <leader>f :AsyncRun flake8 --ignore=E501 %<Cr><Esc>:copen<Cr>
" set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" set formatoptions=cq foldignore= wildignore+=*.py[co]
" set completeopt=menuone,longest,preview
" hi OverLength ctermbg=darkred ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" <leader>ld to go to definition
autocmd FileType python nnoremap <buffer>
      \ <leader>gd :call LanguageClient_textDocument_definition()<cr>
" <leader>lh for type info under cursor
autocmd FileType python nnoremap <buffer>
      \ <leader>K :call LanguageClient_textDocument_hover()<cr>
" <leader>lr to rename variable under cursor
autocmd FileType python nnoremap <buffer>
      \ <leader>gr :call LanguageClient_textDocument_rename()<cr>


