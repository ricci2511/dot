return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
      ensure_installed = {
        -- LSPs
        "gopls",
        "typescript-language-server",
        "svelte-language-server",
        "tailwindcss-language-server",
        "json-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "lua-language-server",
        "marksman",
        "yaml-language-server",
        -- DAPs
        "delve",
        "go-debug-adapter",
        "js-debug-adapter",
        -- Linters
        "markdownlint",
        "hadolint",
        -- Formatters
        "gofumpt",
        "goimports",
        "prettier",
        "shfmt",
        "markdownlint",
        "stylua",
      },
    },
  },
}
