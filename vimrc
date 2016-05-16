
call plug#begin('~/.vim/bundle')
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'jlanzarotta/bufexplorer' 
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'LaTeX-Box-Team/LaTeX-Box'
  Plug 'pearofducks/ansible-vim'
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  Plug 'tomtom/tcomment_vim'
  " tabular always before vim-markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'tpope/vim-surround'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'tpope/vim-fugitive'
  "  Plug 'Valloric/YouetompleteMe'
  Plug 'Shougo/neocomplete.vim'
  " Plug 'derekwyatt/vim-scala'
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
  Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
  Plug 'chriskempson/base16-vim'
  Plug 'kien/ctrlp.vim'
  Plug 'hashivim/vim-terraform'
  Plug 'm-kat/aws-vim'
  Plug 'rking/ag.vim'
  Plug 'Konfekt/FastFold'
  Plug 'pangloss/vim-javascript'
  Plug 'Valloric/MatchTagAlways' 
call plug#end()

if has("nvim") 
  set backspace=2

  let g:resu = ""
  function JobHandler(job_id, data, event)
    if a:event == 'stdout'
       let str = self.shell.' out: '.join(a:data)
       let g:resu = g:resu."\n".str
    elseif a:event == 'stderr'
      let str = self.shell.' err: '.join(a:data)
      let g:resu = g:resu."\n".str
    else
      :cexpr g:resu
      let g:resu = ""
    endif
  endfunction
  let callbacks = {
        \ 'on_stdout': function('JobHandler'),
        \ 'on_stderr': function('JobHandler'),
        \ 'on_exit': function('JobHandler')
        \ }
  " map <leader>lx <Esc>:call jobstart("xelatex.sh +3 +b +o +n \"main.tex\"", extend({'shell': 'xelatex'}, callbacks))<CR>
  map <leader>lx <Esc>:call jobstart("rubber -s --inplace -f --pdf --module xelatex \"main\"", extend({'shell': 'rubber'}, callbacks))<CR>
else 
  map <leader>lb  <Esc>:!pdflatex.sh +3 +b +o "%:p"<CR>
  map <leader>ll  <Esc>:!pdflatex.sh +3 +o "%:p"<CR>
  map <leader>lck <Esc>:!pdflatex.sh -kk "%:p"<CR>
  map <leader>lm <Esc>:!pdflatex.sh +3 +b +o "main.tex"<CR>
  " map <leader>lx <Esc>:!xelatex.sh +3 +b +o "main.tex"<CR>
  map <leader>lx <Esc>:!rubber -s -f --pdf --inplace --module xelatex "main.tex"<CR>
endif

syntax on
" error in < 7.4
if v:version > 704 
  set regexpengine=1
endif

" NERD
nmap <silent> <c-n> :NERDTreeToggle<CR>
nmap <silent> <F8> :TagbarToggle<CR>

set nocompatible
set hlsearch
" tabs and firends
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=100
set ignorecase 
set smartcase
set incsearch
set autochdir
" directory for swp files
set directory=/tmp
set wildmenu
set wildmode=longest,list
set showcmd
set showmatch
set pastetoggle=<F10>
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on 
" set mouse in terminal to resize windows
set mouse=a
set laststatus=2 

"GUI
if has('gui_running')
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
else
  let base16colorspace=256
  set background=dark
  colorscheme base16-solarized
  " let g:solarized_termcolors=256
  " set  background=light
  " colorscheme solarized 
endif

" au FileType tex set background=light | let g:solarized_termcolors=256 | colorscheme solarized 

cmap w!! %!sudo tee > /dev/null %
"tab navigation
"from Practical Vim book
nnoremap <silent> <C-h> :bprev<CR> 
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> [b :bprev<CR> 
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Reselect last pasted text
nnoremap gp `[v`]
" highlight search matching
" włączenie (zp) i wyłązenie (zP) korekty pisowni dla j.polskiego
map zp :setlocal spell spelllang=pl<CR>
map zP :setlocal nospell<CR>

" " włączenie (ze) i wyłączenie (zE) korekty pisowni dla j.angielskiego
map ze :setlocal spell spelllang=en<CR>
map zE :setlocal nospell<CR>
map zus :setlocal spell spelllang=en_us<CR>

if $TERM =~ '^screen-256color'
  map <Esc>OH <Home>
  map! <Esc>OH <Home>
  map <Esc>OF <End>
  map! <Esc>OF <End>
endif

fu! ToggleCurline ()
  if &cursorline && &cursorcolumn 
    set nocursorline
    set nocursorcolumn
  else
    set cursorline
    set cursorcolumn
  endif
endfunction

map <silent><leader>cl :call ToggleCurline()<CR>

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

imap jj <Esc>
nnoremap <S-CR> O<Esc>
nnoremap <CR> o<Esc>
map <Esc>OM <S-CR>

" Go
let mapleader = "\\"
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
" au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"mutt
"
au BufRead /tmp/mutt-* set tw=78 

" Airline
"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tagbar#enabled = 0


"Goyo
let g:goyo_width=100
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


autocmd FileType aws.json setlocal foldmethod=syntax | setlocal foldlevel=4

" Ctrlp
let g:ctrlp_cmd = 'CtrlPMRU'


