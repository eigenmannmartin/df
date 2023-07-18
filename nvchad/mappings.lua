---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<CR>"] = { "<cmd>FineCmdline<CR>", "enter command mode", opts = { noremap = true } },
    ["<leader>R"] = { "<cmd>Neotest run<CR>", "run tests", opts = { noremap = true } },
    ["<leader>RS"] = { "<cmd>Neotest summary<CR>", "toggle neotest summary", opts = { noremap = true } },
    ["<leader>RA"] = {
      function ()
        require("neotest").run.run(vim.fn.expand("%"))
      end
    }
  },
}

-- more keybinds!

return M
