-- Extra 1 character on normal mode navigation
vim.opt.virtualedit = "onemore"

-- Absolute line number
vim.opt.relativenumber = false
vim.opt.selection = "inclusive"

-- Disable autoformat
vim.g.autoformat = false

-- Indetation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

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
