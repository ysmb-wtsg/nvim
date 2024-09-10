vim.g.mapleader = " "

-- for conciseness
local keymap = vim.keymap

-- normal mode
keymap.set("n", "<C-a>", "gg<S-v><S-g>")
keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')
keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
keymap.set("n", "J", "<C-d>")
keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})
keymap.set("n", "K", "<C-u>")
keymap.set("n", "H", "0")
keymap.set("n", "L", "$")
keymap.set("n", "oi", "o", { desc = "Insert a blank line in InsertMode" })
keymap.set("n", "oo", "o<ESC>", { desc = "Insert a blank line in NormalMode" })
keymap.set("n", "O", "<S-o><ESC>")
keymap.set("n", "tn", "<C-w>T", { desc = "Open current buffer in new tab" })
keymap.set("n", "tl", ":tabn<CR>", { silent = true, desc = "Next tab" })
keymap.set("n", "th", ":tabp<CR>", { silent = true, desc = "Previous tab" })
keymap.set("n", "<Tab>", ">>")
keymap.set("n", "<S-Tab>", "<<")
keymap.set("n", "x", '"_x')
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("n", ";", ":")

-- insert mode
keymap.set("i", "jj", "<ESC>")
keymap.set("i", "<C-CR>", "<ESC>%%a")

-- visual mode
keymap.set("v", "c", '"_c')
keymap.set("v", "g+", "g<C-a>gv")
keymap.set("v", "g-", "g<C-x>gv")
keymap.set("v", "j", "gj")
keymap.set("v", "J", "<C-d>")
keymap.set("v", "k", "gk")
keymap.set("v", "K", "<c-u>")
keymap.set("v", "H", "0")
keymap.set("v", "L", "$")
keymap.set("v", "<Tab>", ">gv")
keymap.set("v", "<S-Tab>", "<gv")
keymap.set("v", "x", '"_x')
keymap.set("v", "+", "<C-a>gv")
keymap.set("v", "-", "<C-x>gv")

-- using leader
keymap.set("n", "<leader>hx", "<cmd>nohl<CR>", { silent = true, desc = "Disable hilight" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { silent = true, desc = "Close buffer" })
keymap.set("n", "<leader>rp", ":%s/", { silent = true, desc = "Replace" })
keymap.set("n", "<leader>rf", "<cmd>e<CR>", { silent = true, desc = "Refresh buffer" })
keymap.set("n", "<leader>sv", "<C-w>v", { silent = true, desc = "Split vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { silent = true, desc = "Split horizontally" }) -- split window vertically
