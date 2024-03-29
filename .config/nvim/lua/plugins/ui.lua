return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true -- Add border to lsp hoverdoc
      table.insert(opts.routes, {
        -- Supress "No information available" messages for lsp hoverdoc
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
         _           _ ___   ____________
   _____(_)_________(_)__ \ / ____<  <  /
  / ___/ / ___/ ___/ /__/ //___ \ / // / 
 / /  / / /__/ /__/ // __/____/ // // /  
/_/  /_/\___/\___/_//____/_____//_//_/   
                                         
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
