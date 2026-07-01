---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        -- Mappa lo Spazio per aprire i file o le cartelle dentro l'albero laterale
        ["<space>"] = { "open", config = { id = "nowait" } },
      },
    },
  },
}
