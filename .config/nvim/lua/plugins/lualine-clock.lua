return {
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            sections = {
                lualine_z = {
                    function()
                        return " " .. os.date("%d %A, %I:%M:%S %p")
                    end,
                },
            },
        },
    },
}
