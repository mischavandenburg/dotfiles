return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--glob", "!**/.git/*", "-L" },
        },
      },
    },
  },
}

-- Custom ripgrep configuration:

-- I want to search in hidden/dot files.
-- "--hidden"
--
-- I don't want to search in the `.git` directory.
-- "--glob")
-- "!**/.git/*")
--
--  I want to follow symbolic links
-- "-L"
--
