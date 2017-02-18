set title
set number
set gdefault
set wildmenu
set nobackup
set incsearch
set expandtab
set smartcase
set ignorecase
set nohlsearch
set noshowmode
set autoindent
set shiftround
set cursorline
set cursorcolumn
set nojoinspaces
set nowritebackup

set bs=2
set shell=sh
set diffopt+=vertical
set tabstop=2
set scrolloff=5
set laststatus=2
set shiftwidth=2
set softtabstop=2
set winminheight=0
set backspace=eol,start,indent
set matchpairs+=(:),{:},[:],<:>,':',":"

nmap <tab> w
nmap  :wq!

map <leader>b  <Esc>:set cc=79<CR>
map <leader>nb <Esc>:set cc=0<CR>
map <leader>n  <Esc>:set nonumber!<CR>
map <leader>\  <Esc>:setlocal nospell<CR>
map <leader>pl <Esc>:setlocal spell spelllang=pl<CR>
map <leader>en <Esc>:setlocal spell spelllang=en_gb<CR>
map <leader>p  <Esc>:set paste!<CR>
map <leader>g  <Esc>:Gstatus<CR>
map <leader>gp <Esc>:Gpush<CR>

au BufRead,BufNewFile *.pp
  \ set filetype=puppet
filetype plugin indent on

call plug#begin('~/.config/vim-plugins')
Plug 'godlygeek/tabular'
Plug 'rodjek/vim-puppet'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'brendonrapp/smyck-vim'
Plug 'pearofducks/ansible-vim'
Plug 'bitc/vim-bad-whitespace'
call plug#end()

syntax on
colorscheme smyck
set background=dark
hi BadWhitespace ctermbg=lightblue guibg=lightblue

if has("gui_running")
  set guioptions-=e
  set guioptions-=r
  set guioptions-=L
  set guifont=MesloLGSDZ\ Nerd\ Font:h12
endif

let g:syntastic_auto_jump = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_puppet_puppetlint_args = "--no-80chars-check --no-autoloader_layout-check --no-nested_classes_or_defines-check --no-only_variable_string-check"

let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileencoding' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'LightLineFugitive',
  \   'readonly': 'LightLineReadonly',
  \   'modified': 'LightLineModified'
  \ },
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
  \ 'tabline_separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'tabline_subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
  \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help" || &filetype == "gitcommit"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
