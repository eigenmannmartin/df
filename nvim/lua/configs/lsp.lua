local configs = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  awk_ls = {},
  bashls = {},
  svelte = {},
  gopls = {
    filetypes = { "go", "gomod" }
  },
  ltex = {
    filetypes = {  "markdown", "md", "tex", "neorg", "norg" },
    settings = {
      ltex = {
        language = "auto",
        setenceCacheSize = 2000,
        completionEnabled = true,
        checkFrequency = "save",
        statusBarItem = true
      }
    }
  },

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
