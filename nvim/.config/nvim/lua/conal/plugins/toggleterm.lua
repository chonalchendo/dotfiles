return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<c-\\>", desc = "Toggle Terminal" },
		{ "<leader>ao", desc = "Toggle OpenCode" },
		{ "<leader>ac", desc = "Toggle Claude" },
		{ "<leader>at", desc = "Toggle Terminal" },
	},
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<c-\>]],
			direction = "vertical",
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			persist_mode = true,
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
			},
		})

		-- Custom terminals for AI agents
		local Terminal = require("toggleterm.terminal").Terminal

		local opencode = Terminal:new({
			cmd = "opencode",
			direction = "vertical",
			hidden = true,
			on_open = function(term)
				vim.cmd("startinsert!")
			end,
		})

		local claude = Terminal:new({
			cmd = "claude",
			direction = "vertical",
			hidden = true,
			on_open = function(term)
				vim.cmd("startinsert!")
			end,
		})

		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			hidden = true,
			float_opts = {
				border = "curved",
				width = function()
					return math.floor(vim.o.columns * 0.9)
				end,
				height = function()
					return math.floor(vim.o.lines * 0.9)
				end,
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>ao", function()
			opencode:toggle()
		end, { desc = "Toggle OpenCode" })

		vim.keymap.set("n", "<leader>ac", function()
			claude:toggle()
		end, { desc = "Toggle Claude" })

		vim.keymap.set("n", "<leader>at", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })

		vim.keymap.set("n", "<leader>gl", function()
			lazygit:toggle()
		end, { desc = "Toggle Lazygit" })

		-- Terminal mode mappings for easier escape
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
