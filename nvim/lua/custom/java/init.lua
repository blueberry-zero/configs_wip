-- Create the augroup
-- vim.cmd [[
--     augroup jdtls_lsp
--         autocmd!
--         autocmd FileType java lua require'config.jdtls'.setup_jdtls()
--     augroup end
-- ]]

local jdtls_lsp_group = vim.api.nvim_create_augroup("jdtls_lsp", { clear = true })

-- Create the autocmd
vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
        vim.treesitter.start()
        pcall(require("custom.java.config").setup_jdtls)
    end,
    group = jdtls_lsp_group
})
