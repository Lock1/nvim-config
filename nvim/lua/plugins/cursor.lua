return {
    "mvllow/modes.nvim",
    event = "VeryLazy",
    opts = {
        colors = {
            bg = "", -- fallback to Normal highlight group
            copy = "#fcb12d",
            delete = "#e02d12",
            insert = "#3f5bd9",
            visual = "#18c4de",
        },
        line_opacity = 0.15,
        set_cursor = true,
        set_cursorline = true,
        set_number = true,
        set_signcolumn = true,
        ignore = { "NvimTree", "TelescopePrompt", "!minifiles" },
    },
}
