set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" the stdpath on my mac is /Users/mischa/.local/share/nvim

Plug 'pearofducks/ansible-vim'
Plug 'rhysd/committia.vim'

call plug#end()

let g:ansible_unindent_after_newline = 1
let g:ansible_extra_keywords_highlight = 1

set rtp+=/usr/local/opt/fzf
