local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
local packer = require 'packer'
local util = require 'packer.util'
packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
return packer.startup(function(use)
    use('wbthomason/packer.nvim')

    -- Dependencies
    use { 'nvim-lua/plenary.nvim' }

    -- Themes / highlighting
    use { 'dracula/vim', as = 'dracula' }
    vim.cmd([[
      augroup DraculaOverrides
        autocmd!
        autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
        autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
        autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
      augroup end
    ]])

    use { 'sheerun/vim-polyglot' }

    -- LSP
    -- use {'ray-x/lsp_signature.nvim'}
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'b0o/schemastore.nvim' }
    use(require('plugins-config.nvim-cmp'))
    use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }

    -- Snippets
    use { 'dsznajder/vscode-es7-javascript-react-snippets' }
    use { 'OmniSharp/omnisharp-vscode' }

    -- Editing
    use(require('plugins-config.autopairs'))
    use { 'tpope/vim-surround' }
    use(require('plugins-config.closetag'))
    use(require('plugins-config.indent-blankline'))

    -- UI / Info
    use(require('plugins-config.lualine'))
    use(require('plugins-config.trouble'))
    use(require('plugins-config.todo-comments'))
    use { 'onsails/lspkind-nvim' }
    use { 'tpope/vim-commentary' }

    -- Git
    use(require('plugins-config.gitsigns'))
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-rhubarb' }

    -- Testing
    use(require('plugins-config.vim-test'))

    -- Navigation
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use(require('plugins-config.telescope'))
    use(require('plugins-config.nvim-treesitter'))
    use(require('plugins-config.nvim-tree'))
end
)
