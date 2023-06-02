vim.o.termguicolors = true

require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})

vim.cmd([[ colorscheme duskfox ]])
