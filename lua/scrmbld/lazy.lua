-- "install" lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--brach=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'failed to load lazy.nvim:\n', 'ErrorMsg' },
			{out, 'WarningMsg' },
			{'\nPress any key to exit'},
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nvim
require('lazy').setup({
	spec={
		-- imoprt plugins
		{ import = 'plugins' },
	},
	-- Other settings
	-- check for plugin updates automagically
	checker = { enabled = true },
})
