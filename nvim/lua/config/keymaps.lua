-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

-- Neo-tree
vim.keymap.set("n", "<C-b>", "<Cmd>Neotree toggle<CR>", { desc = "Toggle file tree", silent = true })
