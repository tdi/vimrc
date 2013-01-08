call pathogen#infect()

set nocompatible
set laststatus=2 
let g:Powerline_symbols = 'unicode'
syntax on


" NERD
nmap <silent> <c-n> :NERDTreeToggle<CR>
nmap <silent> <F8> :TagbarToggle<CR>

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

"GUI
if has('gui_running')
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  let g:solarized_termcolors=256
  colorscheme solarized
  set background=dark
else
  colorscheme wombatterm
"  set background=dark
endif

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
set ai
set si

" włączenie (zp) i wyłączenie (zP) korekty pisowni dla j.polskiego
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

" Until I got used to it 
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

imap jj <Esc>

" Python
let g:jedi#auto_initialization = 1
let g:jedi#show_function_definition = 0
let g:jedi#popup_on_dot = 0

