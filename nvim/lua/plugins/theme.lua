return {
    -- { "olimorris/onedarkpro.nvim" },
    -- {
    --     "LazyVim/LazyVim",
    --     opts = {
    --         colorscheme = "onedark_dark",
    --     },
    -- },
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vscode_modern").setup({
            cursorline = true,
            transparent_background = false,
            nvim_tree_darker = true,
        })
        vim.cmd.colorscheme("vscode_modern")
        
        -- Custom overrides
        vim.api.nvim_set_hl(0, "TermCursor", { fg = "#cc8b5a", bg = "#5a7ecc"}) -- Cursor
    end,
}
