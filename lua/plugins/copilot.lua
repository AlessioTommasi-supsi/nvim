return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        -- Accetta tutto il blocco di codice
        accept = "<A-Down>", -- Alt + Freccia Giù

        -- Accetta una parola alla volta
        accept_word = "<A-S-Right>", -- Ctrl + Freccia Destra

        -- Navigazione tra i suggerimenti alternativi
        next = "<A-Right>", -- Alt + Freccia Destra
        prev = "<A-Left>", -- Alt + Freccia Sinistra

        -- Nascondi il suggerimento se disturba
        dismiss = "<A-Up>", -- Alt + Freccia Su

      },
    },
    -- Enable suggestion for all file types
    filetypes = {
      ["*"] = true,
    },
  },
}
