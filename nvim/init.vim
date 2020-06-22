call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'csscomb/vim-csscomb'
Plug 'fmoralesc/vim-tutor-mode'
call plug#end()

:set number

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
