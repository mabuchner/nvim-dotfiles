let mapleader=','

set undofile

" Enable spell-checking
set spell
set spelllang=en_gb

" Show line numbers
set number relativenumber
" Increase the width of the number column
set numberwidth=5

" Always show error gutter column
set signcolumn=yes
" Highlight current line
set cursorline
" Color certain column
set colorcolumn=80,100
" Show matching brackets
set showmatch
" Always show tab bar
set showtabline=2
" When searching try to be smart about cases
set smartcase
" Ignore case when searching
set ignorecase
" Enable wildmenu
set wildmode=longest:list,full

set tabstop=4
set shiftwidth=4
set expandtab

" Enable mouse input
set mouse=a
set mousemodel=popup

augroup setFileSyntax
  autocmd!
  autocmd BufNewFile,BufRead *.mm set filetype=objcpp
  autocmd BufNewFile,BufRead *.vl set filetype=json
augroup END

augroup custom-shift-width
  autocmd!
  autocmd FileType javascript,json,typescript,typescriptreact setlocal shiftwidth=2 tabstop=2
augroup END

" Better formatting for git commit messages
"autocmd Filetype gitcommit setlocal spell colorcolumn=72 textwidth=72 formatoptions+=a

" Better formatting for markdown files
"autocmd Filetype markdown setlocal spell wrap linebreak nolist complete+=kspell

" Netrw
let g:netrw_preview=1 " Preview files in a vertical split (press p to preview)
let g:netrw_liststyle=3 " Tree style listing
let g:netrw_winsize=30 " With a vertical split open, show the directory listing with only 30 columns
" Show line numbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keys.vim
