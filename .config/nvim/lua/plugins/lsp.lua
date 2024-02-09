return {
  -- Others are already handled by lazyvim.plugins.extras.lang...
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svelte = {},
      },
    },
  },
}
