---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "window up" },
    -- ["<CR>"] = { "<cmd>FineCmdline<CR>", "enter command mode", opts = { noremap = true } },
    ["<leader>rr"] = { "<cmd>Neotest run<CR>", "run tests", opts = { noremap = true } },
    ["<leader>rs"] = { "<cmd>Neotest summary<CR>", "toggle neotest summary", opts = { noremap = true } },
    ["<leader>ra"] = {
      function ()
        require("neotest").run.run(vim.fn.expand("%"))
      end
    }
  },
}

-- more keybinds!

return M
