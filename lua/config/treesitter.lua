require('nvim-treesitter').setup({
	ensure_installed = {"c", "c++", "lua"},
	highlight = { enable = true },
	indent = { enable = true },
})
vim.diagnostic.config({
	virtual_text = true,
})

