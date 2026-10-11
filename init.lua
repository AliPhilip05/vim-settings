-- Set startup globals before loading mappings or plugins.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Let nvim-tree handle directory buffers from the start.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("josean.core")
require("josean.lazy")
