local status, obsidian = pcall(require, "obsidian")
if not status then
  return
end

obsidian.setup({
  workspaces = {
    {
      path = "~/",
    },
  },
  ui = {
    checkboxes = {
      [" "] = { char = "🥚", hl_group = "ObsidianTodo" },
      ["x"] = { char = "🐣", hl_group = "ObsidianDone" },
    },
  },
})
