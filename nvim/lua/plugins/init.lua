return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

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
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "ltex-ls",
        "black",
        "dockerfile-language-server",
        "svelte-language-server",
        "bash-language-server"
      },
    },
  },

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"html",
				"css",
				"bash",
				"lua",
				"markdown",
				"vim",
				"vimdoc",
        "svelte",
			},
		},
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

  {
  "zbirenbaum/neodim",
  event = "LspAttach",
  config = function()
    require("neodim").setup({
      refresh_delay = 75,
      alpha = 0.75,
      blend_color = "#000000",
      hide = {
        underline = true,
        virtual_text = true,
        signs = true,
      },
      regex = {
        "[uU]nused",
        "[nN]ever [rR]ead",
        "[nN]ot [rR]ead",
      },
      priority = 128,
      disable = {},
    })
  end
  },

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
		},
	},

	{
		"folke/flash.nvim",
		enabled = true,
		event = "VeryLazy",
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
  "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lsp"
    end,
  },

	{
		"VonHeikemen/fine-cmdline.nvim",
		lazy = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		enabled = true,
	},

	{
		"nvim-neorg/neorg",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    version = "v7.0.0",
		event = "BufEnter *.norg",
		ft = { "norg" },
		lazy = true,
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {
            config = {
              folds = true,
              init_open_folds = "never",
              icon_preset = "varied",
            },
          }, -- Adds pretty icons to your document
					["core.esupports.indent"] = {
						config = {
							format_on_enter = true,
							format_on_escape = true,
						},
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
			})
		end,
	},

	{
		"michaelb/sniprun",
		--event = "VeryLazy",
		cmd = "SnipRun",
		--keys = {
		--	{ "<leader>sr", "<cmd>SnipRun<CR>", mode = "n" },
		--	{ "<leader>sr", "<cmd>'<,'>SnipRun<CR>", mode = "v" },
		--},
		branch = "master",
		build = "sh install.sh",
		config = function()
			require("sniprun").setup({
				selected_interpreters = { "Python3_fifo" },
				repl_enable = { "Python3_fifo" },
			})
		end,
	},

	{
		"andythigpen/nvim-coverage",
	},

	{
		"braxtons12/blame_line.nvim",
		lazy = false,
	},

  {
    'stevearc/oil.nvim',
    opts = {},
		event = "VeryLazy",
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    'mbbill/undotree',
		event = "VeryLazy",
  }
}
