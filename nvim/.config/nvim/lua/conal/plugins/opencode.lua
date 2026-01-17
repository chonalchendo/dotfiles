return {
	{
		"folke/snacks.nvim",
		opts = {
			input = {},
			picker = {},
			terminal = {},
		},
	},
	{
		"NickvanDyke/opencode.nvim",
		dependencies = {
			"folke/snacks.nvim",
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				-- Use tmux provider since you have tmux configured
				provider = {
					enabled = "tmux",
					tmux = {
						-- Opens opencode in a new tmux pane
						direction = "right",
						size = 40,
					},
				},
			}

			-- Required for opts.events.reload
			vim.o.autoread = true

			local keymap = vim.keymap

			-- Ask opencode with context
			keymap.set({ "n", "x" }, "<leader>oa", function()
				require("opencode").ask("@this: ", { submit = false })
			end, { desc = "Ask opencode..." })

			-- Ask and submit immediately
			keymap.set({ "n", "x" }, "<leader>os", function()
				require("opencode").ask("@this: ", { submit = true })
			end, { desc = "Ask opencode (submit)" })

			-- Select from prompts/commands
			keymap.set({ "n", "x" }, "<leader>op", function()
				require("opencode").select()
			end, { desc = "Opencode prompts/commands" })

			-- Toggle opencode panel
			keymap.set({ "n", "t" }, "<leader>oo", function()
				require("opencode").toggle()
			end, { desc = "Toggle opencode" })

			-- Operator for adding range to opencode
			keymap.set({ "n", "x" }, "<leader>or", function()
				return require("opencode").operator("@this ")
			end, { desc = "Add range to opencode", expr = true })

			-- Quick actions
			keymap.set({ "n", "x" }, "<leader>oe", function()
				require("opencode").prompt("explain")
			end, { desc = "Explain with opencode" })

			keymap.set({ "n", "x" }, "<leader>of", function()
				require("opencode").prompt("fix")
			end, { desc = "Fix with opencode" })

			keymap.set({ "n", "x" }, "<leader>od", function()
				require("opencode").prompt("document")
			end, { desc = "Document with opencode" })

			keymap.set({ "n", "x" }, "<leader>ot", function()
				require("opencode").prompt("test")
			end, { desc = "Add tests with opencode" })

			keymap.set({ "n", "x" }, "<leader>ov", function()
				require("opencode").prompt("review")
			end, { desc = "Review with opencode" })

			-- Scroll opencode
			keymap.set("n", "<leader>ou", function()
				require("opencode").command("session.half.page.up")
			end, { desc = "Scroll opencode up" })

			keymap.set("n", "<leader>oi", function()
				require("opencode").command("session.half.page.down")
			end, { desc = "Scroll opencode down" })

			-- New session
			keymap.set("n", "<leader>on", function()
				require("opencode").command("session.new")
			end, { desc = "New opencode session" })

			-- Focus opencode pane (tmux)
			keymap.set("n", "<leader>og", function()
				-- Move to the right pane where opencode is
				vim.fn.system("tmux select-pane -R")
			end, { desc = "Go to opencode pane" })

			-- Show diff of changes (after opencode edits)
			keymap.set("n", "<leader>ox", "<cmd>DiffviewOpen<CR>", { desc = "Diff opencode changes" })
		end,
	},
}
