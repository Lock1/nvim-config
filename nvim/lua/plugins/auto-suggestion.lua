return {
    "saghen/blink.cmp",
    opts = {
        completion = {
            ghost_text = {
                enabled = false,
            }
        },
        keymap = {
            preset = "enter",
            ["<Esc>"] = {  -- First Esc during auto completion will reject suggestion while maintain insert mode
                function(cmp)
                    if cmp.is_visible() then
                        cmp.cancel()
                    else
                        vim.cmd("stopinsert")
                    end
                end,
            }
        }
    }
}
