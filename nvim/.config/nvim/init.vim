call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'csscomb/vim-csscomb'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

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
colorscheme tokyonight 
set termguicolors

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
