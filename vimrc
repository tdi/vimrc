call pathogen#infect()
set nocompatible
set laststatus=2 
set pastetoggle=<F2>
let g:Powerline_symbols = 'unicode'
syntax on
" Set paste psuje IAMPS w latex
" set paste
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" NERD
nmap <silent> <c-n> :NERDTreeToggle<CR> 
nnoremap <silent> <F8> :TlistToggle<CR>

" Tasklist
map ta <Plug>TaskList
let g:tlTokenList = ['CITE', 'TODO', 'PROF']
set autochdir
set directory=/tmp
set wildmenu
set showcmd
" dla LaTeX
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

colorscheme wombatterm
" ustawienie foldingu wierszy
:map <C-o> zo
:map <C-c> zc

" wykonanie komendy Ctrl+B Michała Kalewskiego (3 przebiegi, bibtex, otwarcie)
:map <C-I> <Esc>:!pdflatex.sh +3 +b +o "%:p"<CR>
:map <C-B> <Esc>:!pdflatex.sh +3 +o "%:p"<CR>
:map <C-K> <Esc>:!pdflatex.sh -kk "%:p"<CR>

" taby i linie
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=79

set ignorecase 
set smartcase
set incsearch
set ai
set si


" włączenie (zp) i wyłączenie (zP) korekty pisowni dla j.polskiego
map zp :setlocal spell spelllang=pl<CR>
map zP :setlocal nospell<CR>

" " włączenie (ze) i wyłączenie (zE) korekty pisowni dla j.angielskiego
map ze :setlocal spell spelllang=en<CR>
map zE :setlocal nospell<CR>
map zus :setlocal spell spelllang=en_us<CR>
map zE :setlocal nospell<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
