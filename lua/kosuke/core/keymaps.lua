vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

function set_to_multimodes (modes, after, before)
  for mode in string.gmatch(modes, "([^,]+)") do
    keymap.set(mode, after, before)
  end
end

-- general keymaps

set_to_multimodes("n,v", "j", "gj")
set_to_multimodes("n,v", "k", "gk")
set_to_multimodes("n,v", "<S-j>", "<C-d>")
set_to_multimodes("n,v", "<S-k>", "<C-u>")
set_to_multimodes("n,v", "<S-h>", "g^")
set_to_multimodes("n,v", "<S-l>", "g$")
keymap.set("n", "<Tab>", ">>")
keymap.set("v", "<Tab>", ">gv")
keymap.set("n", "<S-Tab>", "<<")
keymap.set("v", "<S-Tab>", "<gv")

keymap.set("i", "jj", "<ESC>")
keymap.set("i", "kk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x"')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>fq", ":q!<CR>") -- !=force
keymap.set("n", "<leader>jj", ":wq<CR>")

keymap.set("n", "<loader>s", ":%s/")
keymap.set("n", "<leader>i", "gg=<S-g>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equil width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tl", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>th", ":tabp<CR>") -- go to previous tab

-- plugin keymaps

-- nvim-tree
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fn", "<cmd>Telescope help_tags<CR>")
