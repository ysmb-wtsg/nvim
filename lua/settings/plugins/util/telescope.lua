return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-project.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<C-o>"] = actions.select_default,
            ["<C-s>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.close,
          },
          n = {
            ["o"] = actions.select_default,
            ["s"] = actions.select_vertical,
            ["t"] = actions.select_tab,
            ["q"] = actions.close,
          },
        },
      },
      extensions = {
        ui_select = {
          require("telescope.themes").get_dropdown(),
        },
        project = {
          base_dirs = {
            "~/projects",
            "~/.config",
            "~/dotfiles",
          },
          hidden_files = true,
          theme = "dropdown",
          order_by = "asc",
          search_by = "title",
          sync_with_nvim_tree = true,
        },
      },
    })

    -- telescope.load_extension("fzf")
    telescope.load_extension("project")

    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { silent = true, desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true, desc = "Telescope files" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { silent = true, desc = "Telescope strings" })
    vim.keymap.set("n", "<leader>fp", "<cmd>Telescope project<CR>", { silent = true, desc = "Telescope projects" })
    vim.keymap.set(
      "n",
      "/",
      "<cmd>Telescope current_buffer_fuzzy_find<CR>",
      { silent = true, desc = "Telescope strings in current buffer" }
    )
    vim.keymap.set(
      "n",
      "gr",
      "<cmd>Telescope lsp_references<CR>",
      { silent = true, desc = "Telescope lsp_references" }
    )
    vim.keymap.set(
      "n",
      "gd",
      "<cmd>Telescope lsp_definitions<CR>",
      { silent = true, desc = "Telescope lsp_definitions" }
    )
    vim.keymap.set(
      "n",
      "gt",
      "<cmd>Telescope diagnostics bufnr=0<CR>",
      { silent = true, desc = "Telescope diagnostics in current buffer" }
    )
    vim.keymap.set(
      "n",
      "gT",
      "<cmd>Telescope diagnostics<CR>",
      { silent = true, desc = "Telescope diagnostics in workspace" }
    )
  end,
}
