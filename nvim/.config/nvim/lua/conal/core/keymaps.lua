vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<C-h>", ":bn<CR>") --  go to next tab
keymap.set("n", "<C-t>", ":bp<CR>") --  go to previous tab

-- plugin keybinds

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- barber
-- Move to previous/next
keymap.set("n", "<A-,>", ":bprev<CR>")
keymap.set("n", "<A-.>", ":bn<CR>")
-- Re-order to previous/next
keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>")
-- Goto buffer in position...
keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")
-- Pin/unpin buffer
keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>")
-- Close buffer
keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>")

-- copilot remap
keymap.set("i", "<Right>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
