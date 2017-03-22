
call plug#begin('~/.vim/bundle')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'bling/vim-airline'
  Plug 'easymotion/vim-easymotion'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'justincampbell/vim-eighties'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'jlanzarotta/bufexplorer' 
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'lervag/vimtex'
  Plug 'pearofducks/ansible-vim'
  Plug 'majutsushi/tagbar'
  Plug 'junegunn/seoul256.vim'
  Plug 'tomtom/tcomment_vim'
  " tabular always before vim-markdown
  Plug 'plasticboy/vim-markdown'
  Plug 'tpope/vim-surround'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'wellle/targets.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/echodoc.vim'
  Plug 'fatih/vim-go', { 'for': 'go' }
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
  Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
  Plug 'chriskempson/base16-vim'
  Plug 'sjl/badwolf'
  " Plug 'kien/ctrlp.vim'
  Plug 'm-kat/aws-vim'
  " Plug 'rking/ag.vim'
  Plug 'Konfekt/FastFold'
  Plug 'pangloss/vim-javascript', {'for': 'js'}
  Plug 'Valloric/MatchTagAlways' 
  Plug 'davidhalter/jedi-vim', {'for': 'python'}
call plug#end()

" if has("nvim") 
"   set backspace=2
"   let g:resu = ""
"   function JobHandler(job_id, data, event)
"     if a:event == 'stdout'
"       let str = self.shell.' out: '.join(a:data)
"       let g:resu = g:resu."\n".str
"     elseif a:event == 'stderr'
"       let str = self.shell.' err: '.join(a:data)
"       let g:resu = g:resu."\n".str
"     else
"       :cexpr g:resu
"       let g:resu = ""
"     endif
"   endfunction
"   let callbacks = {
"         \ 'on_stdout': function('JobHandler'),
"         \ 'on_stderr': function('JobHandler'),
"         \ 'on_exit': function('JobHandler')
"         \ }
"   map <leader>lx <Esc>:call jobstart("rubber -s --inplace -f --pdf --module xelatex \"main\"", extend({'shell': 'rubber'}, callbacks))<CR>
" else 
"   map <leader>lx <Esc>:!rubber -s -f --pdf --inplace --module xelatex "main.tex"<CR>
" endif
let mapleader = ","

let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

syntax on
" error in < 7.4
if v:version > 704 
  set regexpengine=1
endif

" NERD
nmap <silent> <c-n> :NERDTreeToggle<CR>
nmap <silent> <F8> :TagbarToggle<CR>

set formatoptions+=j
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
filetype plugin on
filetype indent on 
" set mouse in terminal to resize windows
set mouse=a
set laststatus=2 
set clipboard=unnamed
"GUI
if has('gui_running')
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  let base16colorspace=256
  set background=dark
  colorscheme seoul256
else
  let base16colorspace=256
  set background=dark
  colorscheme seoul256
endif

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

nnoremap <S-CR> O<Esc>
nnoremap <CR> o<Esc>
map <Esc>OM <S-CR>

" Go
" au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
let g:go_fmt_command = "goimports"
" " au FileType go nmap <Leader>gd <Plug>(go-doc)
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tagbar#enabled = 0


"Goyo
let g:goyo_width=100
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


set completeopt-=preview

if !has("nvim")
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_auto_close_preview = 1
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
    return pumvisible() ? "\<C-y>" : "\<CR>"
  endfunction

  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
else 
  set inccommand=nosplit
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
endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType aws.json setlocal foldmethod=syntax | setlocal foldlevel=4
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
  endif


" if has('python')
" py << EOF
" import os
" import os.path, sys
" import vim
"
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
"     python_version = os.listdir(project_base_dir + '/lib')[0]
"
"     site_packages = os.path.join(project_base_dir, 'lib', python_version, 'site-packages')
"     current_directory = os.getcwd()
"
"     sys.path.insert(1, site_packages)
"     sys.path.insert(1, current_directory)
" EOF
" endif
let g:python_host_prog = '/Users/tdi/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/tdi/.pyenv/versions/neovim3/bin/python'
