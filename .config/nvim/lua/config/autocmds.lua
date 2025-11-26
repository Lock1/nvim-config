-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
    callback = function()
        vim.lsp.codelens.refresh()
    end,
})




-- Custom commands
local function generate_ascii_stream(lchar, rchar, consumer)
    for ch = string.byte(lchar), string.byte(rchar) do
        consumer(string.char(ch))
    end
end

vim.api.nvim_create_user_command(
    "WipeRegister",
    function()
        generate_ascii_stream("A", "Z", function(ch) vim.fn.setreg(ch, "") end)
        generate_ascii_stream("a", "z", function(ch) vim.fn.setreg(ch, "") end)
        generate_ascii_stream("0", "9", function(ch) vim.fn.setreg(ch, "") end)
        vim.cmd("wshada!")
        vim.notify("Cleared all registers (A-Za-z0-9)")
    end,
    { desc="Clear all register", nargs=0 }
)

vim.api.nvim_create_user_command(
    "WipeGlobalMark",
    function()
        generate_ascii_stream("A", "Z", function(ch) vim.api.nvim_del_mark(ch) end)
        vim.notify("Cleared all global marks (A-Z)")
    end,
    { desc="Clear all global marks (A-Z)", nargs=0 }
)
