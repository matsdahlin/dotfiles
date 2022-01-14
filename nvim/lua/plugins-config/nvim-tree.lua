return {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icon
  },
  config = function()
    require'nvim-tree'.setup {
      filters = {
        dotfiles = true
      },
      view = {
        side = 'right',
        width = 30,
        auto_resize = false
      }
    }
  end
}

