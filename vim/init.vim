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

au BufRead,BufNewFile *.pp
  \ set filetype=puppet
filetype plugin indent on

call plug#begin('~/.config/vim-plugins')
Plug 'godlygeek/tabular'
Plug 'rodjek/vim-puppet'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'brendonrapp/smyck-vim'
Plug 'bitc/vim-bad-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" has to be called as last plugin
Plug 'ryanoasis/vim-devicons'
call plug#end()

syntax on
colorscheme smyck
set background=dark
hi BadWhitespace ctermbg=lightblue guibg=lightblue

if has("gui_running")
  set guifont=MesloLGSDZ\ Nerd\ Font:h11
endif

let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
