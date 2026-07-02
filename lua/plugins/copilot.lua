---@type LazySpec
return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-A-Down>",      -- Ctrl + Alt + Freccia Giù  
        accept_word = "<C-A-Right>", -- Ctrl + Alt + Freccia Destra  
        next = "<A-1>",              -- Alt + 1
        prev = "<A-2>",              -- Alt + 2 
        dismiss = "<C-A-Up>",        -- Ctrl + Alt + Freccia Su
      },
    },
    filetypes = {
      ["*"] = true,
    },
  },

  -- for duplicate keymaps, we can override the default keymaps here
  config = function(_, opts)
    -- Inizializza copilot con le opzioni base qui sopra
    require("copilot").setup(opts)

    local suggestion = require("copilot.suggestion")
    vim.keymap.set("i", "<A-Down>", function()
      if suggestion.is_visible() then suggestion.accept() else vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Down>", true, true, true), "n", true) end
    end, { desc = "Copilot Accept Alternativo" })
    vim.keymap.set("i", "<A-Up>", function()
      if suggestion.is_visible() then suggestion.dismiss() else vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Up>", true, true, true), "n", true) end
    end, { desc = "Copilot Dismiss Alternativo" })
  end,
}
