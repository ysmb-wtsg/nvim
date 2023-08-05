vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

local function set_to_multimodes (modes, after, before)
  for mode in string.gmatch(modes, "([^,]+)") do
    keymap.set(mode, after, before)
  end
end

-- general keymaps

set_to_multimodes("n,v", "j", "gj")
set_to_multimodes("n,v", "k", "gk")
set_to_multimodes("n,v", "<S-j>", "15j")
set_to_multimodes("n,v", "<S-k>", "15k")
set_to_multimodes("n,v", "<S-h>", "g^")
set_to_multimodes("n,v", "<S-l>", "g$")
keymap.set("n", "<Tab>", ">>")
keymap.set("v", "<Tab>", ">gv")
keymap.set("n", "<S-Tab>", "<<")
keymap.set("v", "<S-Tab>", "<gv")

keymap.set("i", "jj", "<ESC>")
keymap.set("i", "kk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')
set_to_multimodes("n,v", "c", '"_c')
keymap.set("n", "<S-c>", '"_C')

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>fq", ":q!<CR>") -- !=force
keymap.set("n", "<leader>jj", ":wq<CR>")

keymap.set("n", "<leader>s", ":%s/")
keymap.set("n", "<leader>i", "gg=<S-g>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equil width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "tn", ":tabnew<CR>") -- open new tab
keymap.set("n", "tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "tl", ":tabn<CR>") -- go to next tab
keymap.set("n", "th", ":tabp<CR>") -- go to previous tab

keymap.set("n", "<C-a>", "gg<S-v><S-g>")

keymap.set("n", "o", "o<ESC>")
keymap.set("n", "<S-o>", "<S-o><ESC>")

-- mainly for markdown
keymap.set("i", "っj", "<ESC>")
keymap.set("i", "　", " ")
keymap.set("i", "ーー", "- ")
keymap.set("i", "”", '"')
keymap.set("i", "＃", '#')
keymap.set("i", "１。", "1. ")
keymap.set("i", "２。", "2. ")
keymap.set("i", "３。", "3. ")
keymap.set("i", "４。", "4. ")
keymap.set("i", "５。", "5. ")
keymap.set("i", "「」", "[]()<Left><Left><Left>")
keymap.set("i", "＞", ">")
keymap.set("i", "｀", "`")
keymap.set("i", "＊", "*")
keymap.set("i", "〜", "~")
keymap.set("i", "｜", "|")
keymap.set("i", "：", ":")

-- plugin keymaps

-- nvim-tree
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fn", "<cmd>Telescope help_tags<CR>")

-- markdown-preview
keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")
keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<CR>")

