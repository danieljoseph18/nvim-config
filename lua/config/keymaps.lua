local map = vim.keymap.set

-- VSCode: Ctrl+P -> Go to File
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find File" })

-- VSCode: Ctrl+F -> Find in Files (Grep)
map("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { desc = "Find in Files" })

-- VSCode: Ctrl+S -> Save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- VSCode: Alt+Up/Down -> Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })

-- Quit all
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
