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
end

return M
