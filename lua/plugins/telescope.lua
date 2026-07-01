---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")

    opts.defaults = opts.defaults or {}
    opts.defaults.mappings = opts.defaults.mappings or {}
    
    -- Gestione della modalità INSERIMENTO dentro il menu di Telescope
    opts.defaults.mappings.i = vim.tbl_deep_extend("force", opts.defaults.mappings.i or {}, {
      ["<Space>"] = actions.select_default, -- Spazio apre il file
    })
    
    -- Gestione della modalità NORMALE dentro il menu di Telescope
    opts.defaults.mappings.n = vim.tbl_deep_extend("force", opts.defaults.mappings.n or {}, {
      ["<Space>"] = actions.select_default, -- Spazio apre il file
    })

    return opts
  end,
}
