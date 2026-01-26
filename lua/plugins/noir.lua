return {
  {
    "noir-lang/noir-nvim",

    -- Load on Noir files by *pattern* (not by filetype)
    event = { "BufReadPre *.nr", "BufNewFile *.nr" },

    -- Ensure Neovim assigns a filetype for .nr early enough
    init = function()
      vim.filetype.add({
        extension = { nr = "noir" },
      })
    end,
  },
}

