return {
 'nvim-treesitter/nvim-treesitter', 
 run = ':TSUpdate',
 config = function()
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
      "c_sharp",
      "json",
      "yaml",
      "vim",
      "html",
      "scss",
      "elm",
      "lua",
      "graphql",
      "css",
      "svelte"
    },
  }

  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
 end
}
