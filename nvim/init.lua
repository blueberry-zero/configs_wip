-- [[
-- init.lua
-- root lua config file for nvim config
-- ]]

print("loading init.lua")

-- lazy.nvim plugin manager
-- ================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check to see if lazy itself has been cloned, if not clone it into the lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- Add the path to the lazy plugin repositories to the vim runtime path
vim.opt.rtp:prepend(lazypath)

-- Declare a few options for lazy
local opts = {
	change_detection = {
		notify = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
}

-- load core opts
require("core.opts")
-- load general mappings
require("core.utils").load_mappings()
-- load lazy plugins
require("lazy").setup("plugins", opts)
-- load jdtls config
require("custom.java")
-- experimental
require("core.testing");
