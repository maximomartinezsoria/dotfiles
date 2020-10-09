set number
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set expandtab
set relativenumber
set laststatus=2
set noshowmode
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
filetype on

set cmdheight=2


call plug#begin('~/.vim/plugged')

" Themes
Plug 'hzchirs/vim-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json']

Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'eslint/eslint'
Plug 'airblade/vim-gitgutter'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:shmargum/vim-sass-colors.git'

call plug#end()

" Theme configuration

set background=dark
colorscheme vim-material
let g:airline_theme = 'vim-material'

" IDE configuration

if has('termguicolors')
  set termguicolors
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let NERDTreeQuitOnOpen=1

let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nnoremap <esc><esc> :noh<return>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <leader>gd <Plug>(coc-definition)
