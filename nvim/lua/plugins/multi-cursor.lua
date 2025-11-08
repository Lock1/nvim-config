return {
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
        vim.g.VM_maps = {
            ["Find Under"]      = "<C-d>",
            ["Add Cursor Up"]   = "<C-S-Up>",
            ["Add Cursor Down"] = "<C-S-Down>",
        }
    end
}
