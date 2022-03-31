" set foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

call plug#begin()

Plug 'pearofducks/ansible-vim'

call plug#end()

let g:ansible_unindent_after_newline = 1
let g:ansible_extra_keywords_highlight = 1
