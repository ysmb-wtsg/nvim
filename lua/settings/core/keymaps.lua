vim.g.mapleader = " "

-- for conciseness
local keymap = vim.keymap
local silent = { silent = true }

-- normal mode
keymap.set("n", "<C-a>", "gg<S-v><S-g>")
keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')
keymap.set("n", "j", "gj")
keymap.set("n", "J", "<C-d>")
keymap.set("n", "k", "gk")
keymap.set("n", "K", "<C-u>")
keymap.set("n", "H", "0")
keymap.set("n", "L", "$")
keymap.set("n", "oi", "o")
keymap.set("n", "oo", "o<ESC>")
keymap.set("n", "O", "<S-o><ESC>")
keymap.set("n", "tn", "<C-w>T")
keymap.set("n", "tl", ":tabn<CR>", silent)
keymap.set("n", "th", ":tabp<CR>", silent)
keymap.set("n", "<Tab>", ">>")
keymap.set("n", "<S-Tab>", "<<")
keymap.set("n", "x", '"_x')
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("n", "<leader><leader>", "za")
keymap.set("n", ";", ":")

-- insert mode
keymap.set("i", "jj", "<ESC>")
keymap.set("i", "jk", "<ESC>")
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
keymap.set("n", "<leader>hx", "<cmd>nohl<CR>", silent)
keymap.set("n", "<leader>q", "<cmd>q<CR>", silent)
keymap.set("n", "<leader>rp", ":%s/")
keymap.set("n", "<leader>rf", "<cmd>e<CR>", silent)
keymap.set("n", "<leader>sv", "<C-w>v", silent) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", silent) -- split window vertically
keymap.set("n", "<leader>w", "<cmd>w<CR><cmd>SessionSave<CR>", silent)
