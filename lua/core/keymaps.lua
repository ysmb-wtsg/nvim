vim.g.mapleader = " "

-- for conciseness
local keymap = vim.keymap
local silent = { silent = true }

-- normal mode
keymap.set("n", "<C-a>", "gg<S-v><S-g>")
keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')
keymap.set("n", "j", "gj")
keymap.set("n", "J", "15j")
keymap.set("n", "k", "gk")
keymap.set("n", "K", "15k")
keymap.set("n", "H", "0")
keymap.set("n", "L", "$")
keymap.set("n", "oi", "o")
keymap.set("n", "oo", "o<ESC>")
keymap.set("n", "O", "<S-o><ESC>")
keymap.set("n", "tn", ":tabnew<CR>") -- open new tab
keymap.set("n", "tl", ":tabn<CR>") -- go to next tab
keymap.set("n", "th", ":tabp<CR>") -- go to previous tab
keymap.set("n", "tx", ":tabc<CR>") -- close current tab
keymap.set("n", "<Tab>", ">>")
keymap.set("n", "<S-Tab>", "<<")
keymap.set("n", "x", '"_x')
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("n", "<leader><leader>", "za")
keymap.set("n", ";", ":")

-- insert mode
keymap.set("i", "jj", "<ESC>")
keymap.set("i", "kk", "<ESC>")
keymap.set("i", "<C-CR>", "<ESC>%%a")
-- mainly for markdown
keymap.set("i", "っj", "<ESC>")
keymap.set("i", "　", " ")
keymap.set("i", "ーー", "- ")
keymap.set("i", "”", '"')
keymap.set("i", "＃", "#")
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

-- visual mode
keymap.set("v", "c", '"_c')
keymap.set("v", "g+", "g<C-a>gv")
keymap.set("v", "g-", "g<C-x>gv")
keymap.set("v", "j", "gj")
keymap.set("v", "J", "15j")
keymap.set("v", "k", "gk")
keymap.set("v", "K", "15k")
keymap.set("v", "H", "0")
keymap.set("v", "L", "$")
keymap.set("v", "<Tab>", ">gv")
keymap.set("v", "<S-Tab>", "<gv")
keymap.set("v", "x", '"_x')
keymap.set("v", "+", "<C-a>gv")
keymap.set("v", "-", "<C-x>gv")

-- using leader
keymap.set("n", "<leader>a", "<cmd>BasicEasyAction<CR>", silent)
keymap.set("n", "<leader>c", "<cmd>ChatGPT<CR>", silent)
keymap.set("n", "<leader>d", "<cmd>lua Lazydocker_toggle()<CR>", silent)
keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", silent)
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", silent)
keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", silent)
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", silent)
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", silent)
keymap.set("n", "<leader>fp", "<cmd>Telescope project<CR>", silent)
keymap.set("n", "<leader>g", "<cmd>lua Lazygit_toggle()<CR>", silent)
keymap.set("n", "<leader>hd", "<cmd>DiffviewOpen HEAD~1<CR>", silent)
keymap.set("n", "<leader>hf", "<cmd>DiffviewFileHistory %<CR>", silent)
keymap.set("n", "<leader>jj", "<cmd>wq<CR>", silent)
keymap.set("n", "<leader>hx", "<cmd>nohl<CR>", silent)
keymap.set("n", "<leader>q", "<cmd>q<CR>", silent)
keymap.set("n", "<leader>n", ":Note ")
keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", silent)
keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", silent)
keymap.set("n", "<leader>rp", ":%s/")
keymap.set("n", "<leader>rf", "<cmd>e<CR>", silent)
keymap.set("n", "<leader>sv", "<C-w>v", silent) -- split window vertically
keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", silent) -- split window vertically
keymap.set("n", "<leader>t", "<cmd>TroubleToggle document_diagnostics<CR>", silent)
keymap.set("n", "<leader>T", "<cmd>TroubleToggle workspace_diagnostics<CR>", silent)
keymap.set("n", "<leader>w", "<cmd>w<CR><cmd>SessionSave<CR>", silent)
keymap.set("n", "<leader>wp", "<cmd>BufferLinePickClose<CR>", silent)
keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", silent)
keymap.set("n", "/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", silent)
