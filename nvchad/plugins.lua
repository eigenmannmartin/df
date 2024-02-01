local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    event = "InsertEnter",
    opts = overrides.copilot,
    config = function()
      require("copilot").setup({})
    end,
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    -- config = function()
    --  require"telescope".load_extension("frecency")
    -- end,
    dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua"},
  },

  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  {
    "cljoly/telescope-repo.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  {
    "nvim-telescope/telescope-symbols.nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
   "tpope/vim-fugitive",
    lazy = false,
  },

  --  {
  --    "arnaupv/nvim-devcontainer-cli",
  --    opts = {},
  --    lazy = false,
  --    keys = {
  --      {
  --        "<leader>cdu",
  --        ":DevcontainerUp<cr>",
  --        desc = "Up the DevContainer",
  --      },
  --      {
  --        "<leader>cdc",
  --        ":DevcontainerConnect<cr>",
  --        desc = "Connect to DevContainer",
  --      },
  --    }
  --  },

  {
    "folke/flash.nvim",
    enabled = true,
    event = "VeryLazy",
    -- version = "v1.14.0",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = {
              mode = function(str)
                return "\\<" .. str
              end,
            },
          })
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
     },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "VonHeikemen/fine-cmdline.nvim",
    -- event = "LazyVimStarted",
    opts = {},
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim"
    }
  },

  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "nvim-neotest/neotest",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "marilari88/neotest-vitest"
    },
    config = function()
     require('neotest').setup({
       adapters = {
         require('neotest-vitest')
        }
     })
    end
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    enabled = true
  },

  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    "kwkarlwang/bufresize.nvim",
    enabled = true,
    lazy = false,
    config = function()
      local opts = { noremap=true, silent=true }
      require("bufresize").setup({
          register = {
              keys = {
                  { "n", "<leader>q<", "30<C-w><", opts },
                  { "n", "<leader>q>", "30<C-w>>", opts },
                  { "n", "<leader>q+", "10<C-w>+", opts },
                  { "n", "<leader>q-", "10<C-w>-", opts },
                  { "n", "<leader>q_", "<C-w>_", opts },
                  { "n", "<leader>q=", "<C-w>=", opts },
                  { "n", "<leader>q|", "<C-w>|", opts },
                  { "n", "<leader>qo", "<C-w>|<C-w>_", opts },
              },
              trigger_events = { "BufWinEnter", "WinEnter" },
          },
          resize = {
              keys = {},
              trigger_events = { "VimResized" },
              increment = 5,
          },
      })
    end,
  },

  {
    "folke/zen-mode.nvim",
    lazy = false,
  },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    event = "BufEnter *.norg",
    ft = {"norg"},
    lazy = false,
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.esupports.indent"] = {
            config = {
              format_on_enter = true,
              format_on_escape = true,
            }
          },
          ["core.autocommands"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                knowledge = "~/Nextcloud/knowledge",
              },
            },
          },
          ["core.itero"] = {},
          ["core.promo"] = {},
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode",
            },
          },
          ["core.export"] = {},
          ["core.export.markdown"] = {},
        },
      }
    end,
  },

  {
     "amitds1997/remote-nvim.nvim",
     version = "*", -- This keeps it pinned to semantic releases
     dependencies = {
         "nvim-lua/plenary.nvim",
         "MunifTanjim/nui.nvim",
         "rcarriga/nvim-notify",
         -- This would be an optional dependency eventually
         "nvim-telescope/telescope.nvim",
     },
     config = true, -- This calls the default setup(); make sure to call it
     lazy = false
  },
}

return plugins
