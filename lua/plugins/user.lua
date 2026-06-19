---@type LazySpec
return {
  -- == Examples of Adding Plugins ==

  -- Git Diff
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },

  -- Copilot configuration
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
    },
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_command_for_global = 1
    end,
  },

  -- == Examples of Overriding Plugins ==
  
 
  vim.keymap.set({ "n", "i", "v" }, "<MiddleMouse>", "<Esc>", { desc = "Usa il tasto centrale come ESC" })
}
