local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

local project_actions_setup, project_actions = pcall(require, "telescope._extensions.project.actions")
if not project_actions_setup then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-o>"] = actions.select_default,
        ["<C-t>"] = actions.select_tab,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.close,
      },
      n = {
        ["o"] = actions.select_default,
        ["t"] = actions.select_tab,
        ["q"] = actions.close,
      }
    }
  },
  extensions = {
    project = {
      base_dirs = {
        {'~/', max_depth = 3},
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      sync_with_nvim_tree = true, -- default false
      -- default for on_project_selected = find project files
      on_project_selected = function(prompt_bufnr)
        project_actions.change_working_directory(prompt_bufnr, false)
        vim.cmd("SessionRestore")
      end
    }
  }
})

telescope.load_extension("fzf")
telescope.load_extension("project")
