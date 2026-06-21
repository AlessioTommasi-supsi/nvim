return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- usa sempre l'ultima versione dal branch main
  build = "make", -- compila il codice
  opts = {
    provider = "claude", -- Cambia in "openai" se preferisci GPT-4o
    auto_suggestions_provider = "claude",
    behaviour = {
      auto_suggestions = false, -- Mettilo a true se vuoi i suggerimenti stile Copilot mentre scrivi
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      -- Gestisce il rendering del markdown in modo bellissimo
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
