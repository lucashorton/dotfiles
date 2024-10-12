set nocompatible

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'csscomb/vim-csscomb'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-ruby/vim-ruby'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sharkdp/fd'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'Luxed/ayu-vim'
call plug#end()

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

set number
set noshowmode
set hidden

syntax on

" Prettier config
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

set nocompatible " We're running Vim, not Vi!
syntax on " Enable syntax highlighting
filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins

set termguicolors
set background=dark
let g:ayucolor="mirage"
colorscheme ayu

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
