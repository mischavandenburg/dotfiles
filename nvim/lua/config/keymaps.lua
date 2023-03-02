-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set(
  "n",
  "<leader>uP",
  '<cmd>lua require("cmp").setup { enabled = true }<cr>',
  { desc = "Enable completion" }
)
vim.keymap.set(
  "n",
  "<leader>up",
  '<cmd>lua require("cmp").setup { enabled = false }<cr>',
  { desc = "Disable completion" }
)

vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape jk" })
