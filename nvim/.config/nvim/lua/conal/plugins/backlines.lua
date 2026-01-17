return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local backlines = require("ibl")
		backlines.setup()
	end,
}
