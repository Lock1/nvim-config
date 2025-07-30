return {
    "mvllow/modes.nvim",
    event = "VeryLazy",
    opts = {
        colors = {
            bg = "", -- fallback to Normal highlight group
            copy = "#f5c359",
            delete = "FFC23649",
            insert = "FF74DAD2",
            visual = "FF6B1E8F",
        },
        line_opacity = 0.15,
        set_cursor = true,
        set_cursorline = true,
        set_number = true,
        set_signcolumn = true,
        ignore = { "NvimTree", "TelescopePrompt", "!minifiles" },
    },
}