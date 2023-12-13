local opt = vim.opt -- for conciseness

-- line numnbers
opt.number = true
opt.relativenumber = true

opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- yank to clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("=")

-- fold setting
opt.foldmethod = "indent"
opt.foldcolumn = "1"
opt.foldlevel = 255
