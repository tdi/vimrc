call pathogen#infect()
set nocompatible
set laststatus=2 
let g:Powerline_symbols = 'unicode'
syntax on

" TODO: lalall
" Set paste psuje IMAPS w latex
" set paste
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

"GUI
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

" NERD
nmap <silent> <c-n> :NERDTreeToggle<CR> 
nnoremap <silent> <F8> :TlistToggle<CR>


" Tasklist
let g:tlTokenList = ['CITE', 'TODO', 'PROF','FIXME','ADD']
set autochdir
set directory=/tmp
set wildmenu
set wildmode=longest,list
set showcmd

filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on

"set ofu=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"


if has('gui_running')
  let g:solarized_termcolors=256
  colorscheme solarized
  set background=dark
else
  colorscheme wombatterm
"  set background=dark
endif

" colorscheme wombatterm
" ustawienie foldingu wierszy
:map <C-o> zo
:map <C-c> zc
" ESC to jj
imap jj <Esc>

"tab navigation
:map <S-h> gT
:map <S-l> gt
" wykonanie komendy Ctrl+B Michała Kalewskiego (3 przebiegi, bibtex, otwarcie)
":map <C-I> <Esc>:!pdflatex.sh +3 +b +o "%:p"<CR>
":map <C-B> <Esc>:!pdflatex.sh +3 +o "%:p"<CR>
":map <C-K> <Esc>:!pdflatex.sh -kk "%:p"<CR>

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


noremap <C-left> :bprev<CR> 
noremap <C-right> :bnext<CR> 

if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif



" Python
let g:pymode_lint_write = 0
let g:pymode_folding = 0
let g:pymode_motion = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1


