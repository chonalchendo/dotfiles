return {
	"catppuccin/nvim",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "auto", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				blink_cmp = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
-- return {
-- 	"catppuccin/nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		local catppuccin = require("catppuccin")
-- 		catppuccin.setup({
-- 			colorscheme = "latte",
-- 			transparent_background = false,
-- 			term_colors = false,
-- 			styles = {
-- 				comments = "italic",
-- 				functions = "italic",
-- 				keywords = "italic",
-- 				strings = "NONE",
-- 				variables = "NONE",
-- 			},
-- 			integrations = {
-- 				treesitter = true,
-- 				native_lsp = {
-- 					enabled = true,
-- 					styles = {
-- 						errors = "italic",
-- 						hints = "italic",
-- 						warnings = "italic",
-- 						information = "italic",
-- 					},
-- 				},
-- 				gitgutter = false,
-- 				gitsigns = true,
-- 				telescope = true,
-- 				nvimtree = {
-- 					enabled = true,
-- 					show_root = true,
-- 				},
-- 				which_key = true,
-- 				indent_blankline = {
-- 					enabled = false,
-- 					colored_indent_levels = false,
-- 				},
-- 				dashboard = true,
-- 				neogit = false,
-- 				vim_sneak = false,
-- 				fern = false,
-- 				barbar = true,
-- 				bufferline = true,
-- 				markdown = true,
-- 				lightspeed = true,
-- 				ts_rainbow = true,
-- 				hop = true,
-- 				blink_cmp = true,
-- 			},
-- 		})
-- 	end,
-- }
-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		local nightfox = require("nightfox")
-- 		nightfox.setup({
-- 			palettes = {
-- 				terafox = {
-- 					bg1 = "#000000", -- Black background
-- 					bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
-- 					bg3 = "#121820", -- 55% darkened from stock
-- 					sel0 = "#131b24", -- 55% darkened from stock
-- 				},
-- 			},
-- 			options = {
-- 				transparent = true,
-- 				styles = {
-- 					comments = "italic",
-- 					keywords = "bold",
-- 				},
-- 			},
-- 		})
-- 		vim.cmd([[colorscheme carbonfox]])
-- 	end,
-- }
--
-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     local tokyonight = require("tokyonight")
--     tokyonight.setup({
--       style = "night",
--       transparent = true,
--       italic_comments = true,
--       italic_keywords = true,
--       italic_functions = true,
--       italic_variables = true,
--       sidebars = { "qf", "vista_kind", "terminal", "packer" },
--       colors = { hint = "orange", error = "#ff0000" },
--     })
--   vim.cmd([[colorscheme tokyonight-night]])
--   end,
-- }
--

-- return {
--   "projekt0n/github-nvim-theme",
--   priority = 1000,
--   config = function()
--     local github = require("github-theme")
--     github.setup({
--       options = {
--         transparent = true,
--         styles = {
--           comments = "italic",
--           keywords = "bold",
--           types = 'italic,bold'
--         }
--       }
--     })
--     vim.cmd([[colorscheme github_dark_tritanopia]])
--   end,
-- }
--

-- return {
--   "Mofiqul/vscode.nvim",
--   config = function()
--     local vscode = require("vscode")
--     local c = require("vscode.colors")
--
--     vscode.setup({
--       -- style = 'light'
--
--       -- Enable transparent background
--       transparent = true,
--
--       -- Enable italic comment
--       italic_comments = true,
--
--       -- Underline `@markup.link.*` variants
--       underline_links = true,
--
--       -- Disable nvim-tree background color
--       disable_nvimtree_bg = true,
--
--       -- Override colors (see ./lua/vscode/colors.lua)
--       color_overrides = {
--           vscLineNumber = '#FFFFFF',
--       },
--
--       -- Override highlight groups (see ./lua/vscode/theme.lua)
--       group_overrides = {
--           -- this supports the same val table as vim.api.nvim_set_hl
--           -- use colors from this colorscheme by requiring vscode.colors!
--           Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
--       }
--     })
--     vim.cmd([[colorscheme vscode]])
--   end,
-- }
