packloadall

"color dracula
colorscheme gruvbox

set nu
set relativenumber
"set cursorline

set autoread
set autowrite

if has('mouse')
  set mouse=a
endif

set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

set clipboard=unnamedplus
set undolevels=1000

nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

set encoding=utf-8 nobomb

syntax on
set syntax=whitespace

filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp', '\.git', '.venv', 'venv', '-env', '__pycache__', 'node_modules', '\.*-lock.\.*']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_synchronize_focus = 1
let g:nerdtree_tabs_focus_on_files = 0
let g:nerdtree_tabs_startup_cd = 1
let g:nerdtree_tabs_autofind = 0

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Config for prettier 
let g:prettier#config#print_width = 80 
let g:prettier#config#tab_wdidth = 2 
let g:prettier#config#single_quote = 'true'

let g:prettier#auto= 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Config for javascript syntax highlight 
let g:javascript_plugin_jsdoc = 1

"let g:indentLine_color_term = 100
"let g:indentLine_bgcolor_term = 330
"let g:indentLine_color_gui = '#ff0000'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1

let g:ale_sign_column_always = 1

let g:lightline = {}

let g:lightline = {
      \ 'colorscheme': 'Gruvbox',
      \ 'active': {
      \   'left': [
      \               [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'filename', 'readonly', 'modified' ]
      \           ],
      \   'right': [
      \               [ 'linting', 'fileencoding', 'filetype'],
      \            ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'filename': 'LightLineFilename',
      \   'linting': 'LinterStatus',
      \ },
      \ }

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! LightLineFilename()
  return expand('%')
endfunction

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}

" Config for ctrlP fuzzy search files 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
 set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_working_path_mode = '0'


let mapleader=" "
map <leader>r :source ~/.vim/vimrc<CR>

map <leader>d ciw
map <leader>s :wa<CR>
map <leader>q :q<CR>
map <leader>p :PrettierAsync<CR>
map <leader>f :NERDTreeFind<CR>
nmap <leader>t :NERDTreeToggle<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>

nnoremap <F5> :checktime<CR>

