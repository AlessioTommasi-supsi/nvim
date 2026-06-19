return {
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        -- Cartella predefinita dove verranno salvate le immagini
        dir_path = "assets",
        -- Usa percorsi relativi per facilitare lo spostamento del progetto
        use_absolute_path = false,
      },
    },
    keys = {
      -- Mappatura per incollare l'immagine (puoi cambiarla se preferisci)
      { "<Leader>i", "<cmd>PasteImage<cr>", desc = "Incolla Immagine" },
    },
  }
}
