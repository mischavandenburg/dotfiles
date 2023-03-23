-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local o = vim.o
local opt = vim.opt

o.ignorecase = true

-- colorschemes
-- require('gruvbox-material').setup()
-- o.termguicolors = true
g.gruvbox_material_enable_italic_comment = 1

-- undo
-- vim.opt.undodir = vim.fn.expand('~/.nvim/undodir')

-- scrolling
-- vim.opt.relativenumber = true
vim.opt.scrolloff = 8
o.linebreak = true

-- indentation

-- o.expandtab = true              -- convert tabs to spaces
-- o.tabstop = 4                   -- insert 4 spaces for a tab
-- o.shiftwidth = 4                -- the number of spaces inserted for each indentation
-- o.smartindent = true

-- windows
-- vim.o.splitbelow = true
-- vim.o.splitright = true

-- completion
-- vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete
--
-- g.vim_markdown_conceal = 0
--
--
-- opt.vim_markdown_conceal = 0
