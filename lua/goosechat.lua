-- goosechat.lua

local M = {}

function M.copy_down()
	-- Get the visual selection
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")

	-- Convert positions to zero-indexed
	local start_row = s_start[2] - 1
	local start_col = s_start[3] - 1
	local end_row = s_end[2] - 1
	local end_col = s_end[3] - 1

	-- Get the selected text
	local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row, false)

	-- If the selection spans multiple lines, handle the partial line at the end
	if end_col > 0 and end_col < #lines[#lines] then
		lines[#lines] = lines[#lines]:sub(1, end_col)
	end

	-- Insert the selected text one line down
	vim.api.nvim_buf_set_lines(0, end_row + 1, end_row + 1, false, lines)
end

return M
