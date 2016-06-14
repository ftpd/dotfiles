syntax on
set encoding=utf-8
set background=dark
colorscheme smyck
set guifont=MesloLGS\ Nerd\ Font:h11
hi BadWhitespace ctermbg=red guibg=red

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

"nnoremap n nzzzv
"nnoremap N Nzzzv¬

au BufRead,BufNewFile *.pp
  \ set filetype=puppet
filetype plugin indent on

call plug#begin('~/.config/nvim/plugins')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rodjek/vim-puppet'
Plug 'godlygeek/tabular'
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
