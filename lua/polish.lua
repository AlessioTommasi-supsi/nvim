-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Native Auto-save
-- This is more robust than a plugin and has zero overhead.
-- It saves when:
-- 1. You leave insert mode
-- 2. Text is changed in normal mode
-- 3. You switch focus away from Neovim
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
  callback = function()
    if vim.bo.modified and vim.bo.modifiable and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})


-- Il primo tasto (button 7 / laterale) attiva la modalità INSERIMENTO
-- Nota: se il terminale non legge X2Mouse, prova a sostituirlo con ScrollWheelRight
vim.keymap.set("n", "<F12>", "i", { desc = "Entra in inserimento tramite mouse mappato" })
-- Il secondo tasto (button 2 / centrale) attiva la modalità ESC
vim.keymap.set("i", "<MiddleMouse>", "<Esc>", { desc = "Esci in modalità normale con tasto centrale" })
vim.keymap.set("n", "<MiddleMouse>", "<Esc>", { desc = "Annulla azioni in modalità normale" })

