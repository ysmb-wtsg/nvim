local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-o>"] = actions.select_tab,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.close,
      },
      n = {
        ["o"] = actions.select_tab,
        ["q"] = actions.close,
      }
    }
  }
})

telescope.load_extension("fzf")
