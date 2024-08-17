-- goosechat.lua

local M = {}

function M.copy_down()
	-- Get the visual selection
	local v_start = vim.fn.getpos("'<")
	local v_end = vim.fn.getpos("'>")

	local line_start = v_start[2]
	local line_end = v_end[2]

	local lines = vim.fn.getline(line_start, line_end)
	print(lines)

	-- Append text to the end of the buffer
	vim.api.nvim_buf_set_lines(0, -1, -1, true, { "This is a new line" })
end

return M
