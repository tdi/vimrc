
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

"LaTeX
let g:Tex_CompileRule_pdf = 'pdflatex.sh +3 +b +o $*'

" Tasklist
let g:tlTokenList = ['CITE', 'TODO', 'PROF','FIXME','ADD']
set autochdir
set directory=/tmp
set wildmenu
set wildmode=longest,list
set showcmd
" dla LaTeX
filetype plugin on
set grepprg=grep\ -nH\ $*
 filetype indent on
let g:tex_flavor='latex'

set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

colorscheme vividchalk
"colorscheme wombatterm
" ustawienie foldingu wierszy
:map <C-o> zo
:map <C-c> zc
" ESC to jj
imap jj <Esc>

"tab navigation
:map <S-h> gT
:map <S-l> gt
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

" From reddit.com, user stack_underflow
" http://www.reddit.com/r/vim/comments/p0ibb/vim_plugin_that_shows_a_userdefinable_quick/

nnoremap <F3> :call SearchText()<CR>

function! SearchText()
  let s:curline = strpart(getline('.'), 0, col('.'))
  let s:prefix = matchstr(s:curline, '.*{\zs.\{-}\(}\|$\)')
  let pattern = '.*\\\(\w\{-}\)\(\[.\{-}\]\)*{\([^ [\]\t]\+\)\?$'
  if s:curline =~ pattern
    let s:type = substitute(s:curline, pattern, '\1', 'e')
    let s:typeoption = substitute(s:curline, pattern, '\2', 'e')
  endif
if exists("s:type") && s:type =~ 'cite'
  if  !exists("s:vim_open_window") || s:vim_open_window == 0
    let s:vim_open_window = 1
    execute "botright new " . "bib.bib"
    let s:bibwin = winnr()
  else
    execute s:bibwin . "wincmd c"
    let s:vim_open_window = 0 
  endif
endif
endfunction 

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



