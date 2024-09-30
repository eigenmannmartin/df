return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
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
        "bash-language-server",
        "gopls",
        "ts_ls"
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
				"python",
        "typescript",
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
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lsp")
		end,
	},

	{
		"VonHeikemen/fine-cmdline.nvim",
		lazy = false,
		enabled = true,
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
		version = "*",
		lazy = false,
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
				},
			})

			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,
	},

	{
		"andythigpen/nvim-coverage",
		enabled = true,
	},

	{
		"braxtons12/blame_line.nvim",
		lazy = false,
		enabled = true,
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		enabled = true,
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = {
					"icon",
					"permissions",
					"size",
					"mtime",
				},
			})
		end,
	},

	{
		"mbbill/undotree",
		enabled = true,
		event = "VeryLazy",
	},
}
