local status, nightfox = pcall(require, "nightfox")
if not status then
	print("Colorscheme not found!")
	return
end

nightfox.setup({
	options = {
		styles = {
			comments = "italic",
			keywords = "bold",
			functions = "italic,bold",
			variables = "bold",
		},
		transparent = true,
	},
	palettes = {
		-- Custom duskfox with black background
		carbonfox = {
			bg1 = "#000000", -- Black background
			bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
			bg3 = "#121820", -- 55% darkened from stock
			sel0 = "#131b24", -- 55% darkened from stock
		},
	},
	specs = {
		all = {
			inactive = "bg0", -- Default value for other styles
		},
		carbonfox = {
			inactive = "#090909", -- Slightly lighter then black background
		},
	},
	groups = {
		all = {
			NormalNC = { fg = "fg1", bg = "inactive" }, -- Non-current windows
		},
	},
})

vim.cmd("colorscheme carbonfox")
