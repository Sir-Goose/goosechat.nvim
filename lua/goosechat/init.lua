local M = {}

-- Create a new buffer for the chat window
local bufnr = vim.api.nvim_create_buf(false, true)

-- Create a new floating window
local winnr = vim.api.nvim_open_win(bufnr, true, {
	relative = "editor",
	width = math.floor(vim.opt.columns:get() * 0.75),
	height = math.floor(vim.opt.lines:get() * 0.75),
	col = math.floor(vim.opt.columns:get() * 0.125),
	row = math.floor(vim.opt.lines:get() * 0.125),
	style = "minimal",
	focusable = true,
	border = "rounded",
})

-- Set up the buffer for the chat window
vim.bo[bufnr].bufhidden = "wipe"
vim.bo[bufnr].swapfile = false

-- Function to send a message to the AI and display the response
local function send_message()
	local message = vim.fn.input("Message: ")
	-- Make API call to OpenAI here
	-- For now, just echo the message back
	local response = "AI Response: " .. message
	vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { response })
end

-- Set up a mapping to send a message
vim.api.nvim_buf_set_keymap(
	bufnr,
	"n",
	"<CR>",
	'<cmd>lua require("goosechat").send_message()<CR>',
	{ noremap = true, silent = true }
)

M.send_message = send_message

return M
