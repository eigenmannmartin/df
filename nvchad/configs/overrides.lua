local M = {}

M.copilot = {
  filetypes = {
    ["."] = true,
  },
  suttestion = {
    enabled = true,
    auto_trigger = true,
  }
}

M.telescope = {
  extensions_list = { "fzf", "repo", "live_grep_args", "project", "file_browser" },
  no_ignore = true,
  symbols = {
    sources = { "emoji", "kaomoji", "gitmoji" }
  },
  extensions = {
    fzf = {
      fuzzy = true,
    },
    project = {
      base_dirs = {
        {
          '~/code',
          hidden_files = true,
        },
        {
          '~/.config/nvim',
          hidden_files = true,
        },
      }
    } },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "jsonc",
  },
  highlight = {
    enable = false,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = false,
    disable = {
    -- "norg"
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- backend dev stuff
    "python-lsp-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "ltex-ls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
