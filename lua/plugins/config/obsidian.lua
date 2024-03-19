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
})
