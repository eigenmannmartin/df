require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
--map("n", ":", "<cmd>FineCmdline<CR>", { desc = "CMD FineCmdline" })

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Window up" })
map("n", "<leader>gg", "<cmd>EnableBlameLine<CR>", { desc = "Enable blame line" })
map("n", "<leader>gh", "<cmd>DisableBlameLine<CR>", { desc = "Disable blame line" })
map("n", "<leader>rr", "<cmd>SnipRun<CR>", { desc = "Snip run" })
map("v", "<leader>rr", function()
  require('sniprun').run('v')
end, { desc = "snip run" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--map("n", "<leader>a", "<cmd>:AirLatex<CR>")
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

