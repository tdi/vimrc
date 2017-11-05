let mapleader = ","

call plug#begin('~/.vim/bundle')
  Plug 'honza/vim-snippets'
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins'  }
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'Shougo/echodoc.vim'
  Plug 'bling/vim-airline'
  " {{{
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme = 'gruvbox'
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline#extensions#tagbar#enabled = 0
  " }}}
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
" {{{
    nnoremap <silent> <leader>a :Buffers<CR>
    nnoremap <silent> <leader>O :Tags<CR>
    nnoremap <silent> <leader>f :Files<CR>
    nnoremap <silent> <leader>? :History<CR>
    nnoremap <silent> <leader>; :BLines<CR>
    nnoremap <silent> <leader>gl :Commits<CR>
    nnoremap <silent> <leader>ga :BCommits<CR>
" }}}
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'w0rp/ale'
  Plug 'morhetz/gruvbox'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'pearofducks/ansible-vim'
  Plug 'Chiel92/vim-autoformat'
  Plug 'junegunn/seoul256.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'm-kat/aws-vim'
  Plug 'skywind3000/asyncrun.vim'
  " Plug 'jlanzarotta/bufexplorer' 
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'majutsushi/tagbar'
  Plug 'tomtom/tcomment_vim'
  " tabular always before vim-markdown
  Plug 'plasticboy/vim-markdown'
  Plug 'tpope/vim-surround'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'fatih/vim-go', { 'for': 'go' }
  Plug 'lervag/vimtex'
  "{{{
    let g:tex_flavor = "latex"
    let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'
  "}}}
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
  "{{{
    let g:goyo_width=100
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
  "}}}
  Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
  Plug 'kien/ctrlp.vim'
  Plug 'Konfekt/FastFold'
  Plug 'pangloss/vim-javascript'
  Plug 'Valloric/MatchTagAlways' 
  Plug 'kana/vim-textobj-user'
  Plug 'bps/vim-textobj-python', {'for': 'python'}
	" ODKOMNETOWAC
  " Plug 'davidhalter/jedi-vim', {'for': 'python'}
  " Plug 'zchee/deoplete-jedi', {'for': 'python'}
  " Plug 'Shougo/neocomplete.vim'
call plug#end()

" <leader>ld to go to definition
autocmd FileType python nnoremap <buffer>
  \ <leader>gd :call LanguageClient_textDocument_definition()<cr>
" <leader>lh for type info under cursor
autocmd FileType python nnoremap <buffer>
  \ <leader>K :call LanguageClient_textDocument_hover()<cr>
" <leader>lr to rename variable under cursor
autocmd FileType python nnoremap <buffer>
  \ <leader>gr :call LanguageClient_textDocument_rename()<cr>

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}
if executable('pyls')
    " pip install python-language-server
    let g:LanguageClient_serverCommands.python = ['pyls']
    autocmd FileType python setlocal omnifunc=LanguageClient#complete
  else
    echo "No pyls"
endif


set noshowmode
syntax on
if v:version > 704 
  set regexpengine=1
endif

set formatoptions+=j
" in neovim ignored 
set nocompatible
set hlsearch
" tabs and firends
set autoindent
set autoread
set smartindent
set expandtab
set ssop-=options
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
set grepprg=grep\ -nH\ $*
" set mouse in terminal to resize windows
set mouse=a
set laststatus=2 
set clipboard=unnamed


filetype plugin on
filetype indent on 
"GUI for vim only 
if has('gui_running')
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  colorscheme seoul256
else
  set background=dark
  colorscheme gruvbox
endif

"" MAPPINGS 

" Plugin independent mappings
cmap w!! %!sudo tee > /dev/null %
nnoremap <silent> <C-h> :bprev<CR> 
nnoremap <silent> <C-l> :bnext<CR>
" Reselect last pasted text
nnoremap gp `[v`]
" włączenie (zp) i wyłązenie (zP) korekty pisowni dla j.polskiego
map zp :setlocal spell spelllang=pl<CR>
map zP :setlocal nospell<CR>
" " włączenie (ze) i wyłączenie (zE) korekty pisowni dla j.angielskiego
map ze :setlocal spell spelllang=en<CR>
map zE :setlocal nospell<CR>
map zus :setlocal spell spelllang=en_us<CR>



" NERD
nmap <silent> <c-n> :NERDTreeToggle<CR>
nmap <silent> <F8> :TagbarToggle<CR>


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



" nnoremap <S-CR> O<Esc>
nnoremap <CR> o<Esc>
" map <Esc>OM <S-CR>

" Go
" au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
" " au FileType go nmap <Leader>gd <Plug>(go-doc)
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
"
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>c <Plug>(go-coverage)
" au FileType go nmap <Leader>ds <Plug>(go-def-split)
" au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>dt <Plug>(go-def-tab)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Airline



if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


set completeopt-=preview

nnoremap <leader>t  :vsplit +terminal<cr>
tnoremap <leader><esc>      <c-\><c-n>

set inccommand=nosplit
set termguicolors
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_auto_close_preview = 1
let g:deoplete#sources#syntax#min_keyword_length = 3
let g:deoplete#lock_buffer_name_pattern = '\*ku\*'
if !exists('g:deoplete#keyword_patterns')
  let g:deoplete#keyword_patterns = {}
endif
let g:deoplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     deoplete#undo_completion()
inoremap <expr><C-l>     deoplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif

autocmd FileType python nnoremap <silent> <leader>f :AsyncRun flake8 --ignore=E501 %<Cr><Esc>:copen<Cr>
nnoremap <leader>F :Autoformat<Cr>
let python_highlight_all=1
let g:python_host_prog = '/Users/tdi/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/tdi/.pyenv/versions/neovim3/bin/python'

if has('python')
py << EOF
import os
import os.path, sys
import vim

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    python_version = os.listdir(project_base_dir + '/lib')[0]
    site_packages = os.path.join(project_base_dir, 'lib', python_version, 'site-packages')
    current_directory = os.getcwd()
    sys.path.insert(1, site_packages)
    sys.path.insert(1, current_directory)
EOF
endif

