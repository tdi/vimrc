call pathogen#infect()

let g:Powerline_symbols = 'unicode'
set rtp+=/home/tdi/.vim/bundle/powerline/powerline/bindings/vim
syntax on


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
  let g:solarized_termcolors=256
  colorscheme solarized
  set background=dark
else
  if $TERM =~ '^xterm-256color'
    colorscheme wombatterm
  elseif $TERM =~ '^screen'
    colorscheme wombatterm
  else
    colorscheme vividchalk 
  endif
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

set cursorline
set cursorcolumn

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
nnoremap <S-CR> O<Esc>
nnoremap <CR> o<Esc>
map <Esc>OM <S-CR>
" Python
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#show_function_definition = "0"
let g:jedi#popup_on_dot = 0

     
