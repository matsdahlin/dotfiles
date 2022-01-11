local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
return packer.startup(function(use)
    use('wbthomason/packer.nvim')

    -- Dependencies
    use {'nvim-lua/plenary.nvim'}

    -- Themes
    use {'dracula/vim', as = 'dracula'}

    -- LSP

    -- Editing
    use(require('plugins-config.autopairs'))
    use {'tpope/vim-surround'}

    -- UI / Info
    use(require('plugins-config.lualine'))
    use(require('plugins-config.gitsigns'))
    use(require('plugins-config.trouble'))
    use(require('plugins-config.todo-comments'))

    -- Navigation
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use(require('telescope'))
    use(require('plugins-config.nvim-treesitter'))
    use {
          'kyazdani42/nvim-tree.lua',
          requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
          },
          config = function() require'nvim-tree'.setup {} end
        }
  end
)
