return {
  -- Easy comments
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Generate comment (neogen)",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },
  -- Incremental LSP renaming with nice preview highlighting
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
}
