set title
set number
set gdefault
set wildmenu
set nobackup
set incsearch
set expandtab
set smartcase
set splitbelow
set splitright
set ignorecase
set nohlsearch
set noshowmode
set autoindent
set shiftround
set cursorline
set cursorcolumn
set nojoinspaces
set nowritebackup
set termguicolors
"set relativenumber

set bs=2
set tabstop=2
set scrolloff=5
set laststatus=2
set shiftwidth=2
set showtabline=2
set softtabstop=2
set winminheight=0
set backspace=eol,start,indent
set matchpairs+=(:),{:},[:],<:>,':',":"

nmap <tab> <C-w>w
nmap <Esc><CR> :wq!<CR>
nmap <C-p> :Files<CR>
nmap <C-j> :term<CR>
nmap <C-n> :tabnew<CR>
nmap <C-q> :tabclose<CR>
nmap <C-Left> :tabprev<CR>
nmap <C-Right> :tabnext<CR>

map <leader>b  <Esc>:set cc=79<CR>
map <leader>nb <Esc>:set cc=0<CR>
map <leader>n  <Esc>:set nonumber! norelativenumber!<CR>
map <leader>p  <Esc>:set paste!<CR>
map <leader>g  <Esc>:Gstatus<CR>
map <leader>gc <Esc>:Gcommit<CR>
map <leader>gp <Esc>:Gpush<CR>
map <leader>f  <Esc>:Goyo<CR>

filetype plugin indent on

call plug#begin('~/.config/vim-plugins')
Plug 'fatih/molokai'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-terraform'
Plug 'bitc/vim-bad-whitespace'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

syntax on
colorscheme molokai
let g:rehash256=1
set background=dark
hi BadWhitespace ctermbg=lightblue guibg=lightblue
if has("gui")
  set guioptions-=e
  set guioptions-=r
  set guioptions-=L
  set guifont=Hack\ NF:h14
endif

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'options': ['-e', '--layout=reverse', '--height=80%', '--preview', 'bat --color=always --tabs=2 --style=plain --theme="Monokai Extended" {}']}, <bang>0)

let g:lightline = {
  \ 'colorscheme': 'powerlineish',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'FugitiveHead',
  \   'readonly': 'LightLineReadonly'},
  \ }

function! LightLineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
