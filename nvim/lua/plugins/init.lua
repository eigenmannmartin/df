return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      local opts = require "nvchad.configs.mason"
      return {'black', 'ltex-ls', opts}
    end,
  },

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { 
        "html", "css", "bash", "lua", "markdown",
        "vim", "vimdoc"
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
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					signature = {
						enabled = false,
					},
					hover = {
						enabled = false,
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = true,
					lsp_doc_border = true,
				},
			})
		end,
	},

	{
		"VonHeikemen/fine-cmdline.nvim",
		opts = {},
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
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
		event = "BufEnter *.norg",
		ft = { "norg" },
		lazy = false,
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
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
		"tveskag/nvim-blame-line",
		event = "VeryLazy",
		--cmd = "EnableBlameLine",
	},

  {
    "github/copilot.vim",
    cmd = "Copilot"
  }
}
