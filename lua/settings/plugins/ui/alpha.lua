return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		function TakeNote()
			local pickers = require("telescope.pickers")
			local finders = require("telescope.finders")
			local conf = require("telescope.config").values
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")
			local Path = require("plenary.path")

			local function select_directory(current_path, on_done)
				local entries = {}
				local p = io.popen('find "' .. current_path .. '" -mindepth 1 -maxdepth 1 -type d')
				if not p then
					return
				end

				for line in p:lines() do
					local display_name = Path:new(line):make_relative(current_path)
					table.insert(entries, { display = display_name, value = line })
				end
				p:close()

				table.insert(entries, { display = "[Select this folder]", value = current_path })
				table.insert(entries, { display = "[New folder here]", value = "[NEW]" })

				pickers
					.new({}, {
						prompt_title = "Select Folder in: " .. current_path,
						finder = finders.new_table({
							results = entries,
							entry_maker = function(entry)
								return {
									value = entry.value,
									display = entry.display,
									ordinal = entry.display,
								}
							end,
						}),
						sorter = conf.generic_sorter({}),
						attach_mappings = function(prompt_bufnr)
							actions.select_default:replace(function()
								actions.close(prompt_bufnr)
								local selection = action_state.get_selected_entry().value
								if selection == "[NEW]" then
									vim.ui.input({ prompt = "Enter new folder name: " }, function(input)
										if input then
											local new_path = current_path .. "/" .. input
											vim.fn.mkdir(new_path, "p")
											on_done(new_path)
										end
									end)
								elseif selection == current_path then
									on_done(current_path)
								else
									select_directory(selection, on_done)
								end
							end)
							return true
						end,
					})
					:find()
			end

			-- スタート地点は ~/notes
			local notes_root = vim.fn.expand("~/notes")
			select_directory(notes_root, function(final_path)
				vim.cmd("cd " .. final_path)
				local filename =
					string.format("%s/%04d%02d%02d.md", final_path, os.date("%Y"), os.date("%m"), os.date("%d"))
				vim.cmd("e " .. filename)
			end)
		end

		-- Set dashboard buttons
		dashboard.section.buttons.val = {
			dashboard.button("n", "  > Take Note", "<cmd>lua TakeNote()<CR>"),
			dashboard.button("c", "  > Config", "<cmd>e ~/.config/nvim<CR>"),
			dashboard.button("p", "  > Find Projects", "<cmd>Telescope project<CR>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
