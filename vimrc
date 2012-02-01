call pathogen#infect()
set nocompatible
set laststatus=2 
let g:Powerline_symbols = 'unicode'
syntax on

" Set paste psuje IMAPS w latex
" set paste
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

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

" From reddit.com, user stack_underflow
" http://www.reddit.com/r/vim/comments/p0ibb/vim_plugin_that_shows_a_userdefinable_quick/

nnoremap <F1> :call ToggleVimReference()<CR> 
let g:vim_reference_file = "~/.vim/vim-reference"
let g:vim_reference_width = 45

function! ToggleVimReference()
    if !exists("s:vim_reference_open") || s:vim_reference_open == 0
        let s:vim_reference_open = 1
        execute "botright vnew " . g:vim_reference_file
        execute "vertical resize " . g:vim_reference_width
        let s:vim_reference_window = winnr()
    else
        execute s:vim_reference_window . "wincmd c"
        let s:vim_reference_open = 0
    endif
endfunction



