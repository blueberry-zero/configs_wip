-- space management
vim.keymap.set('n', '[o',
    function()
        local count = vim.v.count
        if (count < 1) then count = 1 end

        for _ = 1, count do
            vim.cmd.normal('o')
        end
    end,
    { silent = true })

vim.keymap.set('n', ']o',
    function()
        local count = vim.v.count
        if (count < 1) then count = 1 end

        for _ = 1, count do
            vim.cmd.normal('o')
        end
    end, { silent = true })

-- vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250'
-- vim.opt.guicursor = 'n-v-c:block,i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250'
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20'

-- In your init.lua or plugin configuration
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',-- Apply to all file types
  callback = function()
    vim.treesitter.start()
  end,
})

vim.keymap.set("i", "<C-s>", function()
    vim.cmd("startinsert!")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, true, true), 'n', false)
end, { expr = true })
