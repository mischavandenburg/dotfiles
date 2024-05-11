return {
  "sotte/presenting.nvim",
  opts = {
    -- fill in your options here
    -- see :help Presenting.config
    separator = {
      -- Separators for different filetypes.
      -- You can add your own or oberwrite existing ones.
      -- Note: separators are lua patterns, not regexes.
      markdown = "^#+ ",
      pandoc = "^#+ ",
      org = "^*+ ",
      adoc = "^==+ ",
      asciidoctor = "^==+ ",
    },
  },
  cmd = { "Presenting" },
}
