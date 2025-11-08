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
            -- Warning: This <Esc> mapping will take precedence over bindings in keymaps.lua
            ["<Esc>"] = {  -- First Esc during auto completion will reject suggestion while maintain insert mode
                function(cmp)
                    if cmp.is_visible() then
                        cmp.cancel()
                    else
                        vim.cmd("stopinsert")
                        -- See: keymaps.lua - "Select mode: Exit"
                        vim.api.nvim_feedkeys(
                            vim.api.nvim_replace_termcodes("<C-c>", true, false, true),
                            "s",
                            false
                        )
                    end
                end,
            }
        }
    }
}
