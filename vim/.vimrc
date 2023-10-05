" designed for vim 8+
" Stolen from rwxrob on 27-09-23

if has("eval")                               " vim-tiny lacks 'eval'
  let skip_defaults_vim = 1
endif

set nocompatible

"####################### Vi Compatible (~/.exrc) #######################

" automatically indent new lines
set autoindent " (alpine)

set noflash " (alpine-ish only)

" replace tabs with spaces automatically
set expandtab " (alpine)

" number of spaces to replace a tab with when expandtab
set tabstop=2 " (alpine)

" use case when searching
set noignorecase

" automatically write files when changing when multiple files open
set autowrite

" deactivate line numbers
set nonumber

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

"#######################################################################

" disable visual bell (also disable in .inputrc)
set t_vb=

let mapleader=","

set softtabstop=2

" mostly used with >> and <<
set shiftwidth=2

set smartindent

set smarttab

if v:version >= 800
  " stop vim from silently messing with files that it shouldn't
  set nofixendofline

  " better ascii friendly listchars
  set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

  " i hate automatic folding
  set foldmethod=manual
  set nofoldenable
endif

" mark trailing spaces as errors
match IncSearch '\s\+$'

" enough for line numbers + gutter within 80 standard
set textwidth=72
"set colorcolumn=73

" disable relative line numbers, remove no to sample it
set norelativenumber

" makes ~ effectively invisible
"highlight NonText guifg=bg

" turn on default spell checking
"set spell

" disable spellcapcheck
set spc=

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

set icon

" center the cursor always on the screen
"set scrolloff=999

" highlight search hits
set hlsearch
set incsearch
set linebreak

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

" not a fan of bracket matching or folding
if has("eval") " vim-tiny detection
  let g:loaded_matchparen=1
endif
set noshowmatch

" wrap around when searching
set wrapscan
set nowrap

" Just the formatoptions defaults, these are changed per filetype by
" plugins. Most of the utility of all of this has been superceded by the use of
" modern simplified pandoc for capturing knowledge source instead of
" arbitrary raw text files.

set fo-=t   " don't auto-wrap text using text width
set fo+=c   " autowrap comments using textwidth with leader
set fo-=r   " don't auto-insert comment leader on enter in insert
set fo-=o   " don't auto-insert comment leader on o/O in normal
set fo+=q   " allow formatting of comments with gq
set fo-=w   " don't use trailing whitespace for paragraphs
set fo-=a   " disable auto-formatting of paragraph changes
set fo-=n   " don't recognized numbered lists
set fo+=j   " delete comment prefix when joining
set fo-=2   " don't use the indent of second paragraph line
set fo-=v   " don't use broken 'vi-compatible auto-wrapping'
set fo-=b   " don't use broken 'vi-compatible auto-wrapping'
set fo+=l   " long lines not broken in insert mode
set fo+=m   " multi-byte character line break support
set fo+=M   " don't add space before or after multi-byte char
set fo-=B   " don't add space between two multi-byte chars
set fo+=1   " don't break a line after a one-letter word

" requires PLATFORM env variable set (in ~/.bashrc)
if $PLATFORM == 'mac'
  " required for mac delete to work
  set backspace=indent,eol,start
endif

" stop complaints about switching buffer with changes
set hidden

" command history
set history=100

" here because plugins and stuff need it
if has("syntax")
  syntax enable
endif

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" high contrast for streaming, etc.
set background=dark

" make gutter less annoying
hi SignColumn ctermbg=NONE

" base default color changes (gruvbox dark friendly)
hi StatusLine ctermfg=black ctermbg=NONE
hi StatusLineNC ctermfg=black ctermbg=NONE
hi Normal ctermbg=NONE
hi Special ctermfg=cyan
hi LineNr ctermfg=black ctermbg=NONE
hi SpecialKey ctermfg=black ctermbg=NONE
hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
hi MoreMsg ctermfg=black ctermbg=NONE
hi NonText ctermfg=black ctermbg=NONE
hi vimGlobal ctermfg=black ctermbg=NONE
hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
hi Error ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
hi Search ctermbg=236 ctermfg=darkred
hi vimTodo ctermbg=236 ctermfg=darkred
hi Todo ctermbg=236 ctermfg=darkred
hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
hi MatchParen ctermbg=236 ctermfg=darkred

" color overrides
au FileType * hi StatusLine ctermfg=black ctermbg=NONE
au FileType * hi StatusLineNC ctermfg=black ctermbg=NONE
au FileType * hi Normal ctermbg=NONE
au FileType * hi Special ctermfg=cyan
au FileType * hi LineNr ctermfg=black ctermbg=NONE
au FileType * hi SpecialKey ctermfg=black ctermbg=NONE
au FileType * hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
au FileType * hi MoreMsg ctermfg=black ctermbg=NONE
au FileType * hi NonText ctermfg=black ctermbg=NONE
au FileType * hi vimGlobal ctermfg=black ctermbg=NONE
au FileType * hi goComment ctermfg=black ctermbg=NONE
au FileType * hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Error ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Search ctermbg=236 ctermfg=darkred
au FileType * hi vimTodo ctermbg=236 ctermfg=darkred
au FileType * hi Todo ctermbg=236 ctermfg=darkred
au FileType * hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
au FileType * hi MatchParen ctermbg=236 ctermfg=darkred
au FileType markdown,pandoc hi Title ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc hi Operator ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc set tw=0
au FileType yaml hi yamlBlockMappingKey ctermfg=NONE
au FileType yaml set sw=2
au FileType bash set sw=2
au FileType c set sw=8
au FileType markdown,pandoc noremap j gj
au FileType markdown,pandoc noremap k gk
au FileType sh set noet

set cinoptions+=:0

" Edit/Reload vimrc configuration file
nnoremap confe :e $HOME/.vimrc<CR>
nnoremap confr :source $HOME/.vimrc<CR>

set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))

  " github.com/junegunn/vim-plug

  call plug#begin('~/.local/share/vim/plugins')
  Plug 'zah/nim.vim'
  Plug 'conradirwin/vim-bracketed-paste'
  Plug 'morhetz/gruvbox'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'rwxrob/vim-pandoc-syntax-simple'
  Plug 'dense-analysis/ale'
  call plug#end()

  let g:ale_sign_error = '☠'
  let g:ale_sign_warning = '🙄'
  let g:ale_linters = {'go': ['gometalinter', 'gofmt','gobuild']}

  " pandoc
  let g:pandoc#formatting#mode = 'h' " A'
  let g:pandoc#formatting#textwidth = 72

  " golang
  let g:go_fmt_fail_silently = 0
  let g:go_fmt_command = 'goimports'
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_diagnostic_errors = 1
  let g:go_highlight_diagnostic_warnings = 1
  "let g:go_auto_type_info = 1 " forces 'Press ENTER' too much
  let g:go_auto_sameids = 0
  "    let g:go_metalinter_command='golangci-lint'
  "    let g:go_metalinter_command='golint'
  "    let g:go_metalinter_autosave=1
  set updatetime=100
  "let g:go_gopls_analyses = { 'composites' : v:false }
  au FileType go nmap <leader>m ilog.Print("made")<CR><ESC>
  au FileType go nmap <leader>n iif err != nil {return err}<CR><ESC>
else
  autocmd vimleavepre *.go !gofmt -w % " backup if fatih fails
endif

" force loclist to always close when buffer does (affects vim-go, etc.)
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" format perl on save
if has("eval") " vim-tiny detection
fun! s:Perltidy()
  let l:pos = getcurpos()
  silent execute '%!perltidy -i=2'
  call setpos('.', l:pos)
endfun
"autocmd FileType perl autocmd BufWritePre <buffer> call s:Perltidy()
endif

" format shell on save
if has("eval") " vim-tiny detection
" TODO check for shfmt and shellcheck before defining
" FIXME stop from blowing away file when there is shell error
fun! s:FormatShell()
  let l:pos = getcurpos()
  "silent execute '%!shfmt' " FIXME: bug report to shfmt
  call setpos('.', l:pos)
endfun
autocmd FileType sh autocmd BufWritePre <buffer> call s:FormatShell()
endif

"autocmd vimleavepre *.md !perl -p -i -e 's,(?<!\[)my `(\w+)` (package|module|repo|command|utility),[my `\1` \2](https://gitlab.com/rwxrob/\1),g' %

" fill in empty markdown links with duck.com search
" [some thing]() -> [some thing](https://duck.com/lite?kae=t&q=some thing)
" s,/foo,/bar,g
"autocmd vimleavepre *.md !perl -p -i -e 's,\[([^\]]+)\]\(\),[\1](https://duck.com/lite?kd=-1&kp=-1&q=\1),g' %

" autocmd BufWritePost *.md silent !toemoji %
" autocmd BufWritePost *.md silent !toduck %

" fill in anything beginning with @ with a link to twitch to it
"autocmd vimleavepre *.md !perl -p -i -e 's, @(\w+), [\\@\1](https://twitch.tv/\1),g' %

" make Y consistent with D and C (yank til end)
map Y y$

" better command-line completion
set wildmenu

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" enable omni-completion
set omnifunc=syntaxcomplete#Complete

" force some files to be specific file type
au bufnewfile,bufRead $SNIPPETS/md/* set ft=pandoc
au bufnewfile,bufRead $SNIPPETS/sh/* set ft=sh
au bufnewfile,bufRead $SNIPPETS/bash/* set ft=bash
au bufnewfile,bufRead $SNIPPETS/go/* set ft=go
au bufnewfile,bufRead $SNIPPETS/c/* set ft=c
au bufnewfile,bufRead $SNIPPETS/html/* set ft=html
au bufnewfile,bufRead $SNIPPETS/css/* set ft=css
au bufnewfile,bufRead $SNIPPETS/js/* set ft=javascript
au bufnewfile,bufRead $SNIPPETS/python/* set ft=python
au bufnewfile,bufRead $SNIPPETS/perl/* set ft=perl
au bufnewfile,bufRead user-data set ft=yaml
au bufnewfile,bufRead meta-data set ft=yaml
au bufnewfile,bufRead *.ddl set ft=sql
au bufnewfile,bufRead keg set ft=yaml
au bufnewfile,bufRead *.bash* set ft=bash
au bufnewfile,bufRead *.{peg,pegn} set ft=config
au bufnewfile,bufRead *.gotmpl set ft=go
au bufnewfile,bufRead *.profile set filetype=sh
au bufnewfile,bufRead *.crontab set filetype=crontab
au bufnewfile,bufRead *ssh/config set filetype=sshconfig
au bufnewfile,bufRead .dockerignore set filetype=gitignore
au bufnewfile,bufRead *gitconfig set filetype=gitconfig
au bufnewfile,bufRead /tmp/psql.edit.* set syntax=sql
au bufnewfile,bufRead *.go set spell spellcapcheck=0
au bufnewfile,bufRead commands.yaml set spell
au bufnewfile,bufRead *.txt set spell

"fix bork bash detection
if has("eval")  " vim-tiny detection
fun! s:DetectBash()
    if getline(1) == '#!/usr/bin/bash' || getline(1) == '#!/bin/bash'
        set ft=bash
        set shiftwidth=2
    endif
endfun
autocmd BufNewFile,BufRead * call s:DetectBash()
endif

" displays all the syntax rules for current position, useful
" when writing vimscript syntax plugins
if has("syntax")
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
endif


" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"au BufWritePost ~/.vimrc so ~/.vimrc

" functions keys
map <F1> :set number!<CR> :set relativenumber!<CR>
nmap <F2> :call <SID>SynStack()<CR>
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>
map <F12> :set fdm=indent<CR>

nmap <leader>2 :set paste<CR>i

" disable arrow keys (vi muscle memory)
" noremap <up> :echoerr "Umm, use k instead"<CR>
" noremap <down> :echoerr "Umm, use j instead"<CR>
" noremap <left> :echoerr "Umm, use h instead"<CR>
" noremap <right> :echoerr "Umm, use l instead"<CR>
" inoremap <up> <NOP>
" inoremap <down> <NOP>
" inoremap <left> <NOP>
" inoremap <right> <NOP>

" better use of arrow keys, number increment/decrement
" nnoremap <up> <C-a>
" nnoremap <down> <C-x>

" Better page down and page up
noremap <C-n> <C-d>
noremap <C-p> <C-b>

" Set TMUX window name to name of file
"au fileopened * !tmux rename-window TESTING

" read personal/private vim configuration (keep last to override)
set rtp^=~/.vimpersonal
set rtp^=~/.vimprivate
set rtp^=~/.vimwork

