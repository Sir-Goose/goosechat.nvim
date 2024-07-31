if vim.g.loaded_goosechat then
	return
end
vim.g.loaded_goosechat = true

-- Load the goosechat module
local goosechat = require("goosechat")

-- Create a command to open the chat window
vim.api.nvim_create_user_command("GooseChat", function()
	goosechat.send_message()
end, {})
