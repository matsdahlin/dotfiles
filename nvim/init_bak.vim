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
" Highlight current line
set cursorline

set visualbell
set autoindent
set showmatch

set hlsearch incsearch ignorecase smartcase
"syntax enable
"colorscheme dracula
" let g:dracula_colorterm = 0

let g:indent_blankline_enabled = 0
let g:AutoPairsShortcutToggle = ""
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''

 " -------------
" -- Key maps
" ---------------

let mapleader = "\<space>"

nmap <leader>ve :edit $MYVIMRC<cr>
" nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source $MYVIMRC<cr>

nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>

nmap <leader>qk :cnext <cr>
nmap <leader>qj :cprev <cr>

nmap <leader>il :IndentBlanklineToggle<CR>

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
nnoremap <silent> K :Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <leader>b :NERDTreeToggle<CR>

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

" Fugitive bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gb :Git branch<CR>
nnoremap <leader>go :Git checkout<CR>
nnoremap <leader>gds :Git! diff --staged<CR>

" vim-test
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ta :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>



" auto close tag*.jss
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.ts,*.tsx'
" let g:closetag_xhtml_filetypes = 'xhtml,javascript,jsx,typesscript'
let g:closetag_emptyTags_caseSensitive = 1

" -------------
" -- Plugins
" ---------------

" auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'neovim/nvim-lspconfig'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
    Plug 'onsails/lspkind-nvim'
    Plug 'dsznajder/vscode-es7-javascript-react-snippets'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'ionide/Ionide-vim', { 'do':  'make fsautocomplete' }
    
    " Browse files with preview
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    Plug 'lewis6991/gitsigns.nvim'
    Plug 'folke/trouble.nvim'
    Plug 'folke/todo-comments.nvim'

    " source ~/.config/nvim/plugins/airline.vim
    source ~/.config/nvim/plugins/lualine.vim
    source ~/.config/nvim/plugins/fugitive.vim
    source ~/.config/nvim/plugins/lspsaga.vim
    source ~/.config/nvim/plugins/emmet.vim
    source ~/.config/nvim/plugins/nvim-cmp.vim
    source ~/.config/nvim/plugins/floaterm.vim
    source ~/.config/nvim/plugins/commentary.vim
    source ~/.config/nvim/plugins/vim-test.vim

    " Plug 'rafamadriz/friendly-snippets'

    " Dracula theme
    Plug 'dracula/vim', { 'as': 'dracula' } 

    augroup DraculaOverrides
      autocmd!
      autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
      autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
      autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
      autocmd User PlugLoaded ++nested colorscheme dracula
    augroup end


    " Better syntax support
    Plug 'sheerun/vim-polyglot'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Auto complete
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Surround-with
    Plug 'tpope/vim-surround'

    " Wait until stable release
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

    " File Explorer
    Plug 'scrooloose/NERDTree'

    Plug 'alvan/vim-closetag'
    Plug 'b0o/schemastore.nvim'

call plug#end()

doautocmd User PlugLoaded
" nvim-cmp
set completeopt=menu,menuone,noselect

" NeoVim LSP
lua << EOF

require("trouble").setup() 

require('todo-comments').setup {
  highlight = {
    after = ""
  }
}

require('gitsigns').setup()

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#282a36 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#22232e gui=nocombine]]

require("indent_blankline").setup {
    -- char = "",
    -- char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    -- },
    -- space_char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    -- },
    -- show_trailing_blankline_indent = false,
    show_current_context = true,
    -- show_current_context_start = true,
}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = { left = '|', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_diagnostic'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {
      'quickfix',
      'fugitive'
    }
}

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules" }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- require('telescope').load_extension('fzf')

local on_attach_null = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap=true, silent=true }
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    buf_set_keymap("n", "gd", ":LspDef<CR>", opts)
    buf_set_keymap("n", "gr", ":LspRename<CR>", opts)
    buf_set_keymap("n", "gy", ":LspTypeDef<CR>", opts)
    buf_set_keymap("n", "<Leader>hk", ":LspHover<CR>", opts)
    buf_set_keymap("n", "<Leader>hh", ":LspRefs<CR>", opts)
    buf_set_keymap("n", "[a", ":LspDiagPrev<CR>", opts)
    buf_set_keymap("n", "]a", ":LspDiagNext<CR>", opts)
    buf_set_keymap("n", "ga", ":LspCodeAction<CR>", opts)
    buf_set_keymap("n", "<Leader>a", ":LspDiagLine<CR>", opts)
    buf_set_keymap("i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", opts)

    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end

local on_attach_ts = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

local opts = { noremap=true, silent=true }

client.resolved_capabilities.document_formatting = false
client.resolved_capabilities.document_range_formatting = false

local ts_utils = require('nvim-lsp-ts-utils')
ts_utils.setup({
  -- eslint_bin = "eslint_d",
  -- eslint_enable_diagnostics = true,
  -- eslint_enable_code_actions = true,
  enable_formatting = true,
  formatter = "prettier",
})

ts_utils.setup_client(client)

buf_set_keymap("n", "gs", ":TSLspOrganize<CR>", opts)
buf_set_keymap("n", "gi", ":TSLspRenameFile<CR>", opts)
buf_set_keymap("n", "go", ":TSLspImportAll<CR>", opts)


on_attach_null(client, bufnr)
end


-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()

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
  "elm",
  "lua"
},
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item({behavior=cmp.SelectBehavior.Insert}),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Insert}),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'treesitter' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth= 50})
  }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {'tsserver', 'elmls', 'html'}

local lspconfig = require('lspconfig')

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach_ts,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require('null-ls').setup({
  sources = {
    require("null-ls").builtins.formatting.prettier.with({
        prefer_local = "node_modules/.bin",
    }),
  },
  capabilities = capabilities,
  on_attach = on_attach_null
})
-- lspconfig['null-ls'].setup({ capabilities = capabilities, on_attach = on_attach_null })

lspconfig.jsonls.setup({
  on_attach = on_attach_null,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas()
    }
  }
})

lspconfig.efm.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {"elixir"}
})

lspconfig['rust_analyzer'].setup({
  on_attach = on_attach_null,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
        }
      }
    }
})

local path_to_elixirls = vim.fn.expand("~/.config/nvim/elixir-ls/release/language_server.sh")

lspconfig.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach_null,
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = false,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
})

lspconfig.eslint.setup({

})

EOF

highlight cursorline guibg=#242633
highlight cursorlinenr guibg=#242633
