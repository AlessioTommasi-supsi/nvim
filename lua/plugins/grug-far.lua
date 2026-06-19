return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      -- transientArgs aggiunge i flag direttamente nell'interfaccia utente di grug-far.
      -- Questo forza la modalità multiline sia per le ricerche normali che visuali.
      transientArgs = { "--multiline" }
    })
  end,
}
