local g = vim.g

g.startify_lists = {
    { type = 'bookmarks', header = { '   Bookmarks' }},
    { type = 'sessions', header = { '   Sessions' }},
    { type = 'files', header = { '   MRU' }},
    { type = 'dir', header = { '   MRU ' .. vim.fn.getcwd() }},
    { type = 'commands', header = { '   Commands' }},
}

g.startify_bookmarks = {
    {c = '~/.config/nvim/init.vim'},
    {v = '~/devel/visionlib'},
    {u = '~/UnityProjects/vlUnitySDK-example'}
}

