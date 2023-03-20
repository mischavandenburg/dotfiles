return {
  -- add symbols-outline
  {
    "ixru/nvim-markdown",
    -- cmd = "",
    -- keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "[N]o [N]eckpain" } },
    -- opts =
  },

  {
    "iamcco/markdown-preview.nvim",
    setup = {
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
    },
  },
}
