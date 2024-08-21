-- goosechat.lua

local M = {}

function M.copy_down()
  -- Get the visual selection
  local v_start = vim.fn.getpos("'<")
  local v_end = vim.fn.getpos("'>")

  local line_start = v_start[2]
  local line_end = v_end[2]

  local lines = vim.fn.getline(line_start, line_end)
  -- send to black box
  local response = call_ai_engine(lines)

  -- Append text to the end of the buffer
  local current_buffer = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(current_buffer, -1, -1, true, { response })
end

function call_ai_engine(prompt)
  local python_script_path = vim.fn.getcwd() .. "/python/ai_engine.py"
  local handle = io.popen("python3 " .. python_script_path, "w+")
  handle:write(prompt)
  handle:flush()
  handle:close()
  local response = handle:read("*a")
  handle:close()
  return response
end

return M
