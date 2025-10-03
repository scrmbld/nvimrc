-- load the existing parser configurations
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- create a new configuration for oz
parser_config.oz = {
	highlight = { enable = true },
	indent = { enable = false },
	install_info = {
		-- location of the parser project -- can be git repo or local path
		url = "~/csci/tree-sitter-oz",
		-- url = "~/parsers/tree-sitter-oz/",
		files = { "src/parser.c" },
		-- select default branch
		branch = "main",
	},
	-- which filetype(s) the parser should run on
	filetype = "oz",
}
