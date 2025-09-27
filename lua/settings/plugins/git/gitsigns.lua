return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("scrollbar.handlers.gitsigns").setup()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      current_line_blame = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk in current line" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset hunk in current buffer" })
        map("n", "<leader>ht", gs.toggle_deleted, { desc = "Toggle deleted hunk" })
        map("n", "<leader>hn", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to next hunk" })
        map("n", "<leader>hp", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to previous hunk" })
      end,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1,
        ignore_whitespace = false,
      },
    })
  end,
}
