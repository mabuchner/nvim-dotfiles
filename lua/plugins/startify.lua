-- Startup screen
return {
    "mhinz/vim-startify",
    init = function()
        vim.g.startify_lists = {
            { type = "bookmarks", header = { "   Bookmarks" } },
            { type = "sessions", header = { "   Sessions" } },
            { type = "files", header = { "   MRU" } },
            { type = "dir", header = { "   MRU " .. vim.fn.getcwd() } },
            { type = "commands", header = { "   Commands" } },
        }

        vim.g.startify_bookmarks = {
            { c = "~/.config/nvim/init.vim" },
            { v = "~/devel/visionlib" },
            { u = "~/UnityProjects/vlUnitySDK-example" },
        }
    end,
}
