return {
  -- add symbols-outline
  {
    -- "ixru/nvim-markdown",
    -- cmd = "",
    -- keys = { { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "[N]o [N]eckpain" } },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- {
  --   "lcheylus/overlength.nvim",
  --   config = function()
  --     require("overlength").setup({
  --       textwidth_mode = 0,
  --       default_overlength = 80,
  --       disable_ft = { "qf", "help", "man", "checkhealth", "lazy", "packer", "NvimTree", "Telescope", "WhichKey" },
  --     })
  --   end,
  -- },
}
