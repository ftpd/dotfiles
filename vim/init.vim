call plug#begin('~/.config/vim-plugins')
Plug 'fatih/molokai'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rodjek/vim-puppet'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'frazrepo/vim-rainbow'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/limelight.vim'
Plug 'hashivim/vim-terraform'
Plug 'bitc/vim-bad-whitespace'
Plug 'JamshedVesuna/vim-markdown-preview'
call plug#end()

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
nmap <C-p> :Files ~<CR>
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
map <leader>t  <Esc>:NERDTreeToggle<CR>

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
filetype plugin indent on

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'options': ['-e', '--layout=reverse', '--height=20%', '--preview', 'bat --color=always --tabs=2 --style=plain --theme="Monokai Extended" {}']}, <bang>0)

let g:rainbow_active = 1
let g:terraform_fmt_on_save=1
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
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

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {;<CR> {<CR>};<Esc>O
