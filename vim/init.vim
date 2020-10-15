call plug#begin('~/.config/vim-plugins')
Plug 'ashfinal/vim-colors-paper'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'rodjek/vim-puppet'
Plug 'junegunn/goyo.vim'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/limelight.vim'
Plug 'bitc/vim-bad-whitespace'
call plug#end()

set title
set number
set gdefault
set nobackup
set expandtab
set smartcase
set splitbelow
set splitright
set ignorecase
set nohlsearch
set noshowmode
set shiftround
set cursorline
set cursorcolumn
set nojoinspaces
set nowritebackup

set bs=2
set tabstop=2
set scrolloff=5
set shiftwidth=2
set showtabline=2
set softtabstop=2
set winminheight=0
set matchpairs+=(:),{:},[:],<:>,':',":"

nmap <tab> <C-w>w
nmap <Esc><CR> :wq!<CR>
nmap <C-p> :Files<CR>
nmap <C-a> :Files ~<CR>
nmap <C-n> :tabnew<CR>
nmap <C-q> :tabclose<CR>
nmap <C-k> :tabprevious<CR>
nmap <C-l> :tabnext<CR>
nmap <C-Left> :tabprev<CR>
nmap <C-Right> :tabnext<CR>

map <leader>b  <Esc>:set cc=79<CR>
map <leader>nb <Esc>:set cc=0<CR>
map <leader>n  <Esc>:set nonumber!<CR>
map <leader>p  <Esc>:set paste!<CR>
map <leader>f  <Esc>:Goyo<CR>
map <leader>t  <Esc>:NERDTreeToggle<CR>

set bg=dark
colorscheme paper
set t_ZH=[3m
set t_ZR=[23m
hi Comment cterm=italic gui=italic
hi BadWhitespace ctermbg=lightblue guibg=lightblue

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'options': ['-e', '--layout=reverse', '--preview', 'bat --color always --style=plain --theme="Monokai Extended" {}']}, <bang>0)
command! -bang -nargs=? -complete=dir Colors
  \ call fzf#vim#colors({'options': ['-e', '--layout=reverse', '--preview', '']}, <bang>0)

let g:rainbow_active = 1
let g:terraform_fmt_on_save=1
let g:lightline = {
  \ 'colorscheme': 'powerlineish',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename' ] ],
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
