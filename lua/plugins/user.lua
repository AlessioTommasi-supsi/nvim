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
    build = "cd app && yarn install", -- Comando di build via shell, molto più stabile
    init = function()
      -- 'init' carica le opzioni PRIMA che il plugin venga attivato
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_command_for_global = 1
      vim.g.mkdp_browser = 'firefox'
    end,
  },
  -- == Examples of Overriding Plugins ==
}
