require("config.lazy")
require("config.lsp")
require("config.cmp")
require("config.treesitter")
require("config.style")
require("config.keymap")
require("config.features")

-- idk where else to call this
require("nvim-tree").setup()

vim.opt.clipboard = { 'unnamed', 'unnamedplus' }
