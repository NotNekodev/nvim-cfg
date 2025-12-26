vim.opt.background = "dark"
vim.cmd("colorscheme ayu-mirage")

require('lualine').setup({
	options = {
		theme = 'ayu_mirage'
	}
})

require('noice').setup()

require('fidget').setup()
require("telescope").load_extension("fidget")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.wrap = false

require('gitsigns').setup()
