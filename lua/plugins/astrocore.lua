---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    updater = {
      remote = "origin",
      channel = "stable",
      version = "latest",
      branch = "main",
      commit = nil,
      pin_plugins = nil,
      skip_prompts = false,
      show_changelog = true,
      auto_quit = false,
      remotes = {},
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
      },
    },
    mappings = {
      -- -------------------------------------------------------------
      -- NORMAL MODE (n)
      -- -------------------------------------------------------------
      n = {
        ["<Leader>gv"] = { "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
        ["<Leader>r"] = {
          function()
            require("grug-far").open({
              prefills = { 
                search = vim.fn.expand("<cword>"),
                flags = "--multiline --fixed-strings" 
              }
            })
          end,
          desc = "Cerca e Sostituisci (Grug-far)"
        },
        ["<Leader>rc"] = {
          function()
            require("grug-far").open({
              prefills = {
                search = vim.fn.expand("<cword>"),
                paths = vim.fn.expand("%"),
                flags = "--multiline --fixed-strings" 
              }
            })
          end,
          desc = "Sostituisci nel file corrente (Grug-far)"
        },
        ["<Leader>f"] = {
          function()
            require("grug-far").open({
              prefills = { 
                search = vim.fn.expand("<cword>"),
                flags = "--multiline --fixed-strings" 
              }
            })
          end,
          desc = "Cerca e Sostituisci (Grug-far)"
        },
        ["<Leader>fc"] = {
          function()
            require("grug-far").open({
              prefills = {
                search = vim.fn.expand("<cword>"),
                paths = vim.fn.expand("%"),
                flags = "--multiline --fixed-strings" 
              }
            })
          end,
          desc = "Sostituisci nel file corrente (Grug-far)"
        },
        ["C-S-f"] = {
          function()
            require("grug-far").open({
              prefills = {
                search = vim.fn.expand("<cword>"),
                paths = vim.fn.expand("%"),
                flags = "--multiline --fixed-strings" 
              }
            })
          end,
          desc = "Sostituisci nel file corrente (Grug-far)"
        },
        ["w"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Muovi cursore su" },
        ["s"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Muovi cursore giù" },
        ["<MiddleMouse>"] = { "i", desc = "Entra in Insert Mode" },
        ["<S-Up>"] = { "v<Up>", desc = "Seleziona in su" },
        ["<S-Down>"] = { "v<Down>", desc = "Seleziona in giù" },
        ["<S-Left>"] = { "v<Left>", desc = "Seleziona a sinistra" },
        ["<S-Right>"] = { "v<Right>", desc = "Seleziona a destra" },
        ["<C-a>"] = { "ggVG", desc = "Seleziona tutto" },
        ["<A-S-Down>"] = { "<cmd>m .+1<CR>==", desc = "Sposta riga giù" },
        ["<A-S-Up>"] = { "<cmd>m .-2<CR>==", desc = "Sposta riga su" },
        ["<C-v>"] = { '"+p', desc = "Incolla da Windows" },
        ["<C-z>"] = { "u", desc = "Annulla" },
        ["<C-S-Z>"] = { "<C-r>", desc = "shift annulla" },
        ["<C-\\>"] = { "gcc", remap = true, desc = "Commenta/Decommenta riga" },

        -- Cambia Buffer con Alt + Frecce
        ["<A-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Prossimo buffer" },
        ["<A-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Buffer precedente" },
        -- Ctrl + P per cercare i file
        ["<C-p>"] = { "<cmd>Telescope find_files<cr>", desc = "Trova file (Ctrl+P)" },
        ["<C-f>"] = { 'y/\\V', desc = "Cerca testo selezionato" },
      },

      -- -------------------------------------------------------------
      -- VISUAL MODE (v)
      -- -------------------------------------------------------------
      v = {
        ["<Leader>r"] = {
          function()
            require("grug-far").with_visual_selection({ prefills = { flags = "--multiline --fixed-strings" } })
          end,
          desc = "Sostituisci selezione multi-riga (Grug-far)"
        },
        ["<Leader>rc"] = { 
          function()
            require("grug-far").with_visual_selection({ prefills = { flags = "--multiline --fixed-strings", paths = vim.fn.expand("%") } })
          end,
          desc = "Sostituisci selezione nel file corrente"
        },
        ["<Leader>f"] = {
          function()
            require("grug-far").with_visual_selection({ prefills = { flags = "--multiline --fixed-strings" } })
          end,
          desc = "Sostituisci selezione multi-riga (Grug-far)"
        },
        ["<Leader>fc"] = { 
          function()
            require("grug-far").with_visual_selection({ prefills = { flags = "--multiline --fixed-strings", paths = vim.fn.expand("%") } })
          end,
          desc = "Sostituisci selezione nel file corrente"
        },
        ["C-S-f"] = { 
          function()
            require("grug-far").with_visual_selection({ prefills = { flags = "--multiline --fixed-strings", paths = vim.fn.expand("%") } })
          end,
          desc = "Sostituisci selezione nel file corrente"
        },

        ["w"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Muovi cursore su" },
        ["s"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Muovi cursore giù" },
        ["<MiddleMouse>"] = { "<Esc>", desc = "Torna in Normal Mode" },
        ["<S-Up>"] = { "<Down>", desc = "Estendi selezione su" },
        ["<S-Down>"] = { "<Down>", desc = "Estendi selezione giù" },
        ["<S-Left>"] = { "<Left>", desc = "Estendi selezione sinistra" },
        ["<S-Right>"] = { "<Right>", desc = "Estendi selezione destra" },
        ["<C-a>"] = { "<Esc>ggVG", desc = "Seleziona tutto" },
        ["<A-S-Down>"] = { ":m '>+1<CR>gv=gv", desc = "Sposta selezione giù" },
        ["<A-S-Up>"] = { ":m '<-2<CR>gv=gv", desc = "Sposta selezione su" },
        ["<C-c>"] = { '"+y', desc = "Copia su Windows" },
        ["<C-v>"] = { '"+p', desc = "Incolla da Windows" },
        ["<C-\\>"] = { "gc", remap = true, desc = "Commenta/Decommenta selezione" },
        ["<LeftMouse>"] = { "<S-LeftMouse>", desc = "Estendi selezione fino al clic" },
        -- Cerca la selezione visiva con Ctrl + F nativo e pulito
        ["<C-f>"] = { 'y/\\V<C-r>"', desc = "Cerca testo selezionato" },
 
        -- Ripristinati i vecchi mapping anche per la modalità Visuale
        ["<A-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Prossimo buffer" },
        ["<A-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Buffer precedente" },
        ["<C-p>"] = { "<esc><cmd>Telescope find_files<cr>", desc = "Trova file (Ctrl+P)" },
      }, -- <-- QUESTA PARENTESI ERA SALTATA ED È STATA RIPRISTINATA CORRETTAMENTE

      -- -------------------------------------------------------------
      -- INSERT MODE (i)
      -- -------------------------------------------------------------
      i = {
        ["<MiddleMouse>"] = { "<Esc>", desc = "Torna in Normal Mode" },
        ["<S-Up>"] = { "<Esc>v<Up>", desc = "Seleziona in su" },
        ["<S-Down>"] = { "<Esc>v<Down>", desc = "Seleziona in giù" },
        ["<S-Left>"] = { "<Esc>v<Left>", desc = "Seleziona a sinistra" },
        ["<S-Right>"] = { "<Esc>v<Right>", desc = "Seleziona a destra" },
        ["<C-a>"] = { "<Esc>ggVG", desc = "Seleziona tutto" },
        ["<C-z>"] = { "<C-o>u", desc = "Annulla" },
        ["<C-S-Z>"] = { "<C-o><C-r>", desc = "shift annulla"},
        ["<C-v>"] = { "<C-r>+", desc = "Incolla da Windows" },
        ["<C-\\>"] = { "<C-o>gcc", remap = true, desc = "Commenta/Decommenta riga" },

        ["<A-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Prossimo buffer" },
        ["<A-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Buffer precedente" },
        ["<C-p>"] = { "<C-o><cmd>Telescope find_files<cr>", desc = "Trova file (Ctrl+P)" },
        ["<C-S-f>"] = { 
          function()
            require("grug-far").with_visual_selection({ prefills = { flags = "--multiline --fixed-strings", paths = vim.fn.expand("%") } })
          end,
          desc = "Sostituisci selezione nel file corrente"
        },
        -- apri cerca: Esc + / + Ctrl + R + " per cercare la parola sotto il cursore
        ["<C-f>"] = {   '<Esc>/\\V', desc = "Apri Cerca " },
      },

      -- -------------------------------------------------------------
      -- TERMINAL MODE (t)
      -- -------------------------------------------------------------
      t = {
        ["<A-Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Prossimo buffer" },
        ["<A-Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Buffer precedente" },
        ["<C-p>"] = { [[<C-\><C-n><cmd>Telescope find_files<cr>]], desc = "Trova file (Ctrl+P)" },
      }
    },
  },
}
