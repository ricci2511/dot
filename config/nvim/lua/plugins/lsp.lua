return {
  -- lsp servers not already included in LazyVim extras
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svelte = {},
      },
    },
  },
}
