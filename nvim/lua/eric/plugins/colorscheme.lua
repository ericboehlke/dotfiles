return {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all other plugins
    config = function()
        -- load colorscheme
        vim.cmd([[colorscheme nightfly]])
    end,
}
