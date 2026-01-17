return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		keys = {
			-- f
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fF",
				function()
					require("telescope.builtin").find_files({
						hidden = true,
						no_ignore = true,
					})
				end,
				desc = "Find files (hidden)",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers({
						ignore_current_buffer = true,
						sort_mru = true,
					})
				end,
				desc = "Find buffers",
			},

			-- s
			{
				"<leader>sb",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Search buffer",
			},
			{
				"<leader>sg",
				function()
					require("telescope.builtin").live_grep({
						additional_args = { "--no-ignore" },
					})
				end,
				desc = "Grep files",
			},
			{
				"<leader>sG",
				function()
					require("telescope.builtin").live_grep({
						grep_open_files = true,
					})
				end,
				desc = "Grep files (Open files)",
			},
			{
				"<leader>sh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Search help tags",
			},
			{
				"<leader>sH",
				function()
					require("telescope.builtin").highlights()
				end,
				desc = "Search highlights",
			},
			{
				"<leader>sw",
				function()
					require("telescope.builtin").grep_string({
						word_match = "-w",
					})
				end,
				desc = "Search word",
			},
			{
				"<leader>sw",
				function()
					require("telescope.builtin").grep_string({
						word_match = "-w",
					})
				end,
				mode = "v",
				desc = "Search selection",
			},

			{
				"<leader>R",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume",
			},
		},
		opts = {
			defaults = {
				-- use square corners
				borderchars = {
					"─",
					"│",
					"─",
					"│",
					"┌",
					"┐",
					"┘",
					"└",
				},
				mappings = {
					i = {
						["<c-h>"] = "select_horizontal",
						["<c-x>"] = "which_key",
					},
				},
			},
		},
	},

	-- native fuzzy search for telescope
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = true,
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			opts = { extensions = { fzf = {} } },
		},
		init = function()
			require("telescope").load_extension("fzf")
		end,
	},

	-- telescope undo extension
	{
		"debugloop/telescope-undo.nvim",
		lazy = true,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			opts = {
				extensions = {
					undo = {
						use_delta = false,
						layout_config = {
							preview_width = 0.75,
						},
						mappings = {
							i = {
								["<cr>"] = function(...)
									return require("telescope-undo.actions").yank_additions(...)
								end,
								["<c-y>"] = function(...)
									return require("telescope-undo.actions").yank_deletions(...)
								end,
								["<c-r>"] = function(...)
									return require("telescope-undo.actions").restore(...)
								end,
							},
							n = {
								["y"] = function(...)
									return require("telescope-undo.actions").yank_additions(...)
								end,
								["Y"] = function(...)
									return require("telescope-undo.actions").yank_deletions(...)
								end,
								["r"] = function(...)
									return require("telescope-undo.actions").restore(...)
								end,
							},
						},
					},
				},
				pickers = {
					lsp_document_symbols = {
						symbol_width = 50, -- allow more room for symbol name
					},
					diagnostics = {
						layout_strategy = "vertical",
						layout_config = {
							preview_height = 0.65,
						},
					},
				},
			},
		},
		init = function()
			require("telescope").load_extension("undo")
		end,
		keys = {
			{
				"<leader>su",
				function()
					require("telescope").extensions.undo.undo({})
				end,
				desc = "Search undo history",
			},
		},
	},
}
-- return {
--   "nvim-telescope/telescope.nvim",
--   branch = "0.1.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--     "nvim-tree/nvim-web-devicons",
--     "folke/todo-comments.nvim",
--   },
--   config = function()
--     local telescope = require("telescope")
--     local actions = require("telescope.actions")
--     local transform_mod = require("telescope.actions.mt").transform_mod
--
--     local trouble = require("trouble")
--     local trouble_telescope = require("trouble.sources.telescope")
--
--     -- or create your custom action
--     local custom_actions = transform_mod({
--       open_trouble_qflist = function(prompt_bufnr)
--         trouble.toggle("quickfix")
--       end,
--     })
--
--     telescope.setup({
--       defaults = {
--         path_display = { "smart" },
--         mappings = {
--           i = {
--             ["<C-k>"] = actions.move_selection_previous, -- move to prev result
--             ["<C-j>"] = actions.move_selection_next, -- move to next result
--             ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
--             ["<C-t>"] = trouble_telescope.open,
--           },
--         },
--       },
--     })
--
--     telescope.load_extension("fzf")
--
--     -- set keymaps
--     local keymap = vim.keymap -- for conciseness
--
--     keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
--     keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
--     keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
--     keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
--     keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
--   end,
-- }
--

-- return {
--   "nvim-telescope/telescope.nvim",
--   branch = "0.1.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--     "nvim-tree/nvim-web-devicons",
--   },
--   config = function()
--     local telescope = require("telescope")
--     local actions = require("telescope.actions")
--
--     telescope.setup({
--       defaults = {
--         path_display = { "truncate " },
--         mappings = {
--           i = {
--             ["<C-k>"] = actions.move_selection_previous, -- move to prev result
--             ["<C-j>"] = actions.move_selection_next, -- move to next result
--             ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
--           },
--         },
--       },
--     })
--
--     telescope.load_extension("fzf")
--
--     -- set keymaps
--     local keymap = vim.keymap -- for conciseness
--
--     keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
--     keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
--     keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
--     keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
--
--   end,
-- }
