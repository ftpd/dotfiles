syntax on
set background=dark
colorscheme smyck
set guifont=MesloLGSDZ\ Nerd\ Font
hi BadWhitespace ctermbg=lightblue guibg=lightblue

set gdefault
set nobackup
set nodigraph
set incsearch
set nohlsearch
set nojoinspaces
set nowritebackup

set title
set number
set noshowmode
set ruler
set laststatus=2
set clipboard+=unnamed
set ignorecase
set smartcase
set backspace=eol,start,indent
set winminheight=0
set scrolloff=5
set cursorline
set cursorcolumn

set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set shiftround
set autoindent
set matchpairs+=(:),{:},[:],<:>,':',":"
set bs=2

nmap <tab> w
nmap  :wq!

map <leader>b  <Esc>:set cc=79<CR>
map <leader>nb <Esc>:set cc=0<CR>
map <leader>n  <Esc>:set nonumber!<CR>
map <leader>\  <Esc>:setlocal nospell<CR>
map <leader>pl <Esc>:setlocal spell spelllang=pl<CR>
map <leader>en <Esc>:setlocal spell spelllang=en_gb<CR>
map <leader>p  <Esc>:set paste!<CR>

au BufRead,BufNewFile *.pp
  \ set filetype=puppet
filetype plugin indent on

call plug#begin('~/.config/vim-plugins')
Plug 'godlygeek/tabular'
Plug 'rodjek/vim-puppet'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'bitc/vim-bad-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" has to be called as lat plugin
Plug 'ryanoasis/vim-devicons'
call plug#end()

let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
