return {
 'folke/todo-comments.nvim',
 config = function()
  require('todo-comments').setup {
    highlight = {
      after = ""
    }
  }
 end
}
