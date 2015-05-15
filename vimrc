let where = "desktop"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
if where == "desktop"
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'godlygeek/csapprox'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'chase/vim-ansible-yaml'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ZoomWin'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
endif
call vundle#end()

map <leader>lb  <Esc>:!pdflatex.sh +3 +b +o "%:p"<CR>
map <leader>ll  <Esc>:!pdflatex.sh +3 +o "%:p"<CR>
map <leader>lck <Esc>:!pdflatex.sh -kk "%:p"<CR>
map <leader>lm <Esc>:!pdflatex.sh +3 +b +o "main.tex"<CR>
map <leader>lx <Esc>:!xelatex.sh +3 +b +o "main.tex"<CR>

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
  let g:solarized_termcolors=256
  colorscheme solarized
  set background=dark
else
  if $TERM =~ '256color'
    set background=light
    let g:solarized_termcolors=256
    colorscheme solarized
  elseif $TERM =~ '^screen'
    set background=light
    let g:solarized_termcolors=256
    colorscheme solarized
    " colorscheme wombatterm
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
au BufRead /tmp/mutt-* set tw=72

" Airline
"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#buffer_nr_show = 0

""" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    execute 'colorscheme ' . 'wombatterm'
  endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>
