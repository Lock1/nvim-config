-- Extra 1 character on normal mode navigation
vim.opt.virtualedit = "onemore"

-- Absolute line number
vim.opt.relativenumber = false
vim.opt.selection = "inclusive"

-- Disable autoformat
vim.g.autoformat = false

-- Whitespace & linebreak highlighting
vim.opt.list = true
vim.opt.listchars = {
    tab = "-> ",
    trail = "·",
    nbsp = "%",
    space = "·",
    extends = "❯",
    precedes = "❮",
    eol = "↴",
}
