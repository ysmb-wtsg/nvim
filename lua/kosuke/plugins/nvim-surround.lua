local status, nvim_surround = pcall(require, "nvim-surround")
if not status then
  return
end

nvim_surround.setup({})
