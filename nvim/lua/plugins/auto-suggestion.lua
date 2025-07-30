return {
    "saghen/blink.cmp",
    opts = {
        completion = {
            ghost_text = {
                enabled = false,
            }
        },
        keymap = {
            preset = "default",
            ["<Esc>"] = { "cancel" } -- First Esc during auto completion will reject suggestion while maintain insert mode
        }
    }
}
