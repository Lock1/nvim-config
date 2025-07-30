-- Extra 1 character on normal mode navigation
vim.opt.virtualedit = "onemore"

-- Font
vim.o.guifont = "Hasklug Nerd Font:h14"

-- Transparency
vim.g.neovide_opacity = 0.85
vim.g.neovide_normal_opacity = 0.85

-- Relative line number
vim.opt.relativenumber = true
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
