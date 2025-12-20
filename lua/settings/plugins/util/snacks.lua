return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {},
    input = { enabled = true },
    scroll = { enabled = true },
    dashboard = {
      preset = {
        keys = {
          { icon = "", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":e ~/.config/nvim" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        }
      }
    },
  },
  keys = {
    { "/",          function() require("snacks").picker.lines({ layout = "default" }) end,             desc = "Grep" },
    { "<leader>;",  function() require("snacks").picker.command_history() end,                         desc = "Command History" },
    -- find
    { "<leader>fc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() require("snacks").picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>fg", function() require("snacks").picker.grep({ buf = true }) end,                      desc = "Grep" },
    { "<leader>fp", function() require("snacks").picker.projects() end,                                desc = "Projects" },
    -- git
    { "<leader>gb", function() require("snacks").picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>gl", function() require("snacks").picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>gL", function() require("snacks").picker.git_log_line() end,                            desc = "Git Log Line" },
    { "<leader>gs", function() require("snacks").picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gS", function() require("snacks").picker.git_stash() end,                               desc = "Git Stash" },
    { "<leader>gd", function() require("snacks").picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
    -- Grep
    { "<leader>sb", function() require("snacks").picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sg", function() require("snacks").picker.grep() end,                                    desc = "Grep" },
    { "<leader>sw", function() require("snacks").picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>s"', function() require("snacks").picker.registers() end,                               desc = "Registers" },
    { '<leader>s/', function() require("snacks").picker.search_history() end,                          desc = "Search History" },
    { "<leader>sb", function() require("snacks").picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sc", function() require("snacks").picker.command_history() end,                         desc = "Command History" },
    { "<leader>sh", function() require("snacks").picker.help() end,                                    desc = "Help Pages" },
    { "<leader>si", function() require("snacks").picker.icons() end,                                   desc = "Icons" },
    { "<leader>sk", function() require("snacks").picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>sq", function() require("snacks").picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>su", function() require("snacks").picker.undo() end,                                    desc = "Undo History" },
    -- LSP
    { "gd",         function() require("snacks").picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",         function() require("snacks").picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",         function() require("snacks").picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "gI",         function() require("snacks").picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",         function() require("snacks").picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "gt",         function() require("snacks").picker.diagnostics() end,                             desc = "Diagnostics" },
    { "gT",         function() require("snacks").picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "gai",        function() require("snacks").picker.lsp_incoming_calls() end,                      desc = "C[a]lls Incoming" },
    { "gao",        function() require("snacks").picker.lsp_outgoing_calls() end,                      desc = "C[a]lls Outgoing" },
    { "go",         function() require("snacks").picker.lsp_symbols() end,                             desc = "LSP Symbols" },
  },
}
