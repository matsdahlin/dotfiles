" -------------
" -- General
" ---------------

language en_US
set encoding=utf-8

set expandtab
set shiftwidth=2
set tabstop=2 
set hidden
set softtabstop=2
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
" set spell
set title
set ignorecase
set smartcase
" set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▶\ ,trail:∙
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set backup
set backupdir=$HOME/.config/nvim/backup/
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files

set visualbell
set autoindent
set showmatch

set hlsearch incsearch ignorecase smartcase
"syntax enable
"colorscheme dracula
" let g:dracula_colorterm = 0


" -------------
" -- Key maps
" ---------------

let mapleader = "\<space>"

nmap <leader>ve :edit $MYVIMRC<cr>
" nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source $MYVIMRC<cr>

nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Quicker switching between windows
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Open the current file in the default program
nmap <leader>x :!open %<cr><cr>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" Move line up / down 
nnoremap <leader>J :m .+1<CR>==
nnoremap <leader>K :m .-2<CR>==

" Lspsaga
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>




" -------

"nnoremap <leader>sv :source $MYVIMRC<CR>

" clear search highlight:
nnoremap <leader>h :nohl <CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

set completeopt=menuone,noinsert,noselect
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" -------------
" -- Plugins
" ---------------

" auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir + '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

    source ~/.config/nvim/plugins/airline.vim
    source ~/.config/nvim/plugins/fugitive.vim
    source ~/.config/nvim/plugins/lspsaga.vim
    source ~/.config/nvim/plugins/emmet.vim


    Plug 'neovim/nvim-lspconfig'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

    " Dracula theme
    Plug 'dracula/vim', { 'as': 'dracula' } 

    augroup DraculaOverrides
      autocmd!
      autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
      autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
      autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
      autocmd User PlugLoaded ++nested colorscheme dracula
    augroup end

    " Browse files with preview
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Better syntax support
    " Plug 'sheerun/vim-polyglot

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Auto complete
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Surround-with
    Plug 'tpope/vim-surround'

    " Wait until stable release
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

    " File Explorer
    " Plug 'scrooloose/NERDTree'

call plug#end()
doautocmd User PlugLoaded

" NeoVim LSP
lua << EOF
local nvim_lsp = require('lspconfig')
local coq = require('coq')

local on_attach = function(client, bufnr)

end

-- TypeScript
local servers = {'tsserver', 'elmls', 'html'}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup(coq.lsp_ensure_capabilites({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }))
end

local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '?',
  warn_sign = '?',
  hint_sign = '?',
  border_style = 'round',
}

-- TreeSitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "json",
    "yaml",
    "vim",
    "html",
    "scss",
    "elm"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

EOF
