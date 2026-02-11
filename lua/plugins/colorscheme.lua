return {
    "arcticicestudio/nord-vim",
    lazy = false,
    priority = 1000,
    init = function()
        vim.g.nord_cursor_line_number_background = 1
        vim.g.nord_italic = 1
    end,
    config = function()
        vim.cmd([[colorscheme nord]])
    end,
}
