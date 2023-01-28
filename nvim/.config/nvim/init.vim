set nocompatible

call plug#begin()
Plug 'csscomb/vim-csscomb'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'ghifarit53/tokyonight-vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neomutt/neomutt.vim'
call plug#end()

set number
set noshowmode

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'vue': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'less': ['prettier'],
\   'scss': ['prettier'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'yaml': ['prettier']
\}

let g:ale_fix_on_save = 1

syntax on

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
