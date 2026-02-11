call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'arcticicestudio/nord-vim'

" Startup screen
Plug 'mhinz/vim-startify'

" Remember last file positions
Plug 'farmergreg/vim-lastplace'

" Indentation guides
Plug 'lukas-reineke/indent-blankline.nvim'

" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" Git
Plug 'tpope/vim-fugitive'

" Modifications of surroundings
Plug 'tpope/vim-surround'

" Allow plugins to repeat last action with .
Plug 'tpope/vim-repeat'

" Asynchronous Make
Plug 'tpope/vim-dispatch'

" Mappings for complimentary pairs
Plug 'tpope/vim-unimpaired'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim' " Required by null-ls

" lualine
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'

" tressitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'lewis6991/spellsitter.nvim'

" Comments
Plug 'numToStr/Comment.nvim'

" Latex
Plug 'lervag/vimtex'

call plug#end()

" Configuration

source ~/.config/nvim/plug-config/cmp.lua
source ~/.config/nvim/plug-config/comment.nvim.lua
source ~/.config/nvim/plug-config/fzf.lua
source ~/.config/nvim/plug-config/indent-blankline.lua
source ~/.config/nvim/plug-config/lsp-installer.lua
source ~/.config/nvim/plug-config/lspconfig.lua
source ~/.config/nvim/plug-config/lualine.nvim.lua
source ~/.config/nvim/plug-config/nord.lua
source ~/.config/nvim/plug-config/null-ls.lua
source ~/.config/nvim/plug-config/nvim-treesitter.lua
source ~/.config/nvim/plug-config/spellsitter.lua
source ~/.config/nvim/plug-config/startify.lua
source ~/.config/nvim/plug-config/vim-agriculture.lua
source ~/.config/nvim/plug-config/vim-better-whitespace.lua
source ~/.config/nvim/plug-config/vimtex.lua

