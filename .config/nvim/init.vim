set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" custom commands
"
" line numbers:
" set relativenumber
" set nu
set nohlsearch
set hidden
set ignorecase
set incsearch
set scrolloff=8
set mouse=a
set undodir=~/.vim/undodir
set undofile

:syntax enable

" plugin manager
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
Plug 'sainnhe/gruvbox-material'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" ansible-vim plugin vars
let g:ansible_unindent_after_newline = 1
let g:ansible_extra_keywords_highlight = 1

" indentLine for YAML
let g:indentLine_char = '¦'


" colorscheme config

" Important!!
if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark
" For light version.
"set background=light
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'soft'
" For better performance
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material


" set rtp+=/usr/local/opt/fzf
