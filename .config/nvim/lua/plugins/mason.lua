return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
      -- Others are already handled by lazyvim.plugins.extras.lang...
      ensure_installed = {
        "svelte-language-server",
      },
    },
  },
}
