-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Fix treesitter compiler for Windows
local install = require("nvim-treesitter.install")
install.compilers = { "gcc" }
install.prefer_git = true
vim.env.CC = "C:\\Users\\TOMALE\\AppData\\Local\\nvim\\zig-cc.bat"

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
