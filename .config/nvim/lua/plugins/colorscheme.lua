return {
  { "Mofiqul/dracula.nvim" },
  { "catppuccin/nvim",     name = "catppuccin", priority = 1000 },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    opts = {
      style = "night",
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = false },
        sidebars = "dark",
        floats = "dark",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
