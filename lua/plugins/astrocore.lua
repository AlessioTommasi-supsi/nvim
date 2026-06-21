---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- AstroNvim Updater configuration
    updater = {
      remote = "origin", -- remote to use
      channel = "stable", -- "stable" or "nightly"
      version = "latest", -- "latest", tag name, or nil
      branch = "main", -- branch name (only used if channel is nightly)
      commit = nil, -- commit hash (only used if channel is nightly)
      pin_plugins = nil, -- true, false, or nil
      skip_prompts = false, -- skip prompts about breaking changes
      show_changelog = true, -- show changelog after update
      auto_quit = false, -- automatically quit nvim after update
      remotes = { -- easily add new remotes to track
        -- [ "remote_name" ] = "https://github.com/user/repo.git", -- full remote url
        -- [ "remote_name" ] = "user/repo", -- GitHub user/repo shortcut
      },
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
    },
    -- Mappings can be configured through AstroCore as well.
    mappings = {
      -- Normal mode mappings
      n = {
        ["<Leader>gv"] = { "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
        -- Modalità Normale: Apre Grug-far con la parola sotto il cursore pre-inserita
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
        -- Apre Grug-far filtrato SOLO per il file corrente (parola sotto cursore)
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
        -- 'w' per andare Su
        ["w"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Muovi cursore su" },
        -- 's' per andare Giù
        ["s"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Muovi cursore giù" },
        ["<MiddleMouse>"] = { "<<Nop>" },
        ["<MiddleRelease>"] = { "<Cmd>startinsert<CR>", desc = "Entra in Insert Mode" },
        ["<2-MiddleMouse>"] = { "<Nop>" },
        ["<2-MiddleRelease>"] = { "<Nop>" },
        ["<3-MiddleMouse>"] = { "<Nop>" },
        ["<4-MiddleMouse>"] = { "<Nop>" },
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
      },
      -- Visual mode mappings
      v = {
        -- Modalità Visuale: Prende la selezione (anche multiriga) e inserisce i flag
        ["<Leader>r"] = {
          function()
            require("grug-far").with_visual_selection({
              prefills = {
                flags = "--multiline --fixed-strings"
              }
            })
          end,
          desc = "Sostituisci selezione multi-riga (Grug-far)"
        },
        -- Modalità Visuale: filtrato SOLO per il file corrente + flag attivi
        ["<Leader>rc"] = { 
          function()
            require("grug-far").with_visual_selection({ 
              prefills = {
                flags = "--multiline --fixed-strings",
                paths = vim.fn.expand("%") 
              } 
            })
          end,
          desc = "Sostituisci selezione nel file corrente"
        },
        ["w"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Muovi cursore su" },
        ["s"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Muovi cursore giù" },
        ["<S-Up>"] = { "<Down>", desc = "Estendi selezione su" },
        ["<MiddleMouse>"] = { "<Nop>" },
        ["<MiddleRelease>"] = { "<Esc>", desc = "Torna in Normal Mode" },
        ["<2-MiddleMouse>"] = { "<Nop>" },
        ["<2-MiddleRelease>"] = { "<Nop>" },
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
        ["<C-f>"] = { 
          '"vy/<C-r>v<CR>:%s//<C-r>v/gc<Left><Left><Left>', 
          desc = "Cerca e precompila sostituzione" 
        },
      },
      -- Insert mode mappings
      i = {
        ["<MiddleMouse>"] = { "<Nop>" },
        ["<MiddleRelease>"] = { "<Esc>", desc = "Torna in Normal Mode" },
        ["<2-MiddleMouse>"] = { "<Nop>" },
        ["<2-MiddleRelease>"] = { "<Nop>" },      
        ["<S-Up>"] = { "<Esc>v<Up>", desc = "Seleziona in su" },
        ["<S-Down>"] = { "<Esc>v<Down>", desc = "Seleziona in giù" },
        ["<S-Left>"] = { "<Esc>v<Left>", desc = "Seleziona a sinistra" },
        ["<S-Right>"] = { "<Esc>v<Right>", desc = "Seleziona a destra" },
        ["<C-a>"] = { "<Esc>ggVG", desc = "Seleziona tutto" },
        ["<C-z>"] = { "<C-o>u", desc = "Annulla" },
        ["<C-S-Z>"] = { "<C-o><C-r>", desc = "shift annulla"},
        ["<C-v>"] = { "<C-r>+", desc = "Incolla da Windows" },
        ["<C-\\>"] = { "<C-o>gcc", remap = true, desc = "Commenta/Decommenta riga" },
      },
    },
  },
}
