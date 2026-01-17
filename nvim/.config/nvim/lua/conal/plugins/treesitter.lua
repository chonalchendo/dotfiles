return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	init = function()
		vim.opt.foldenable = false
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"vim",
			"vimdoc",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"json",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"python",
			"rust",
			"sql",
			"yaml",
			"toml",
			"typescript",
			"javascript",
			"c",
			"cpp",
			"java",
			"go",
		},
		highlight = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-i>",
				node_incremental = "<c-i>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		indent = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
-- return {
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		event = { "BufReadPre", "BufNewFile" },
-- 		build = ":TSUpdate",
-- 		dependencies = {
-- 			"nvim-treesitter/nvim-treesitter-textobjects",
-- 		},
-- 		config = function()
-- 			-- import nvim-treesitter plugin
-- 			local treesitter = require("nvim-treesitter.configs")
--
-- 			-- configure treesitter
-- 			treesitter.setup({ -- enable syntax highlighting
-- 				highlight = {
-- 					enable = true,
-- 				},
-- 				-- enable indentation
-- 				indent = { enable = true },
-- 				-- enable autotagging (w/ nvim-ts-autotag plugin)
-- 				autotag = {
-- 					enable = true,
-- 				},
-- 				-- ensure these language parsers are installed
-- 				ensure_installed = {
-- 					"json",
-- 					"html",
-- 					"css",
-- 					"markdown",
-- 					"markdown_inline",
-- 					"bash",
-- 					"lua",
-- 					"vim",
-- 					"dockerfile",
-- 					"gitignore",
-- 					"python",
-- 					"rust",
-- 				},
-- 				incremental_selection = {
-- 					enable = true,
-- 					keymaps = {
-- 						init_selection = "<C-space>",
-- 						node_incremental = "<C-space>",
-- 						scope_incremental = false,
-- 						node_decremental = "<bs>",
-- 					},
-- 				},
-- 			})
-- 		end,
-- 	},
-- }
