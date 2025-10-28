local map = vim.keymap.set

-- Personal muscle memory for text editor programs
-- Undo-redo
map({ "n", "x", "v" }, "<C-z>", "u", { desc = "Undo" })
map("i", "<C-z>", "<C-o>u", { desc = "Undo" })
map({ "n", "x", "v" }, "<C-S-z>", "<C-r>", { desc = "Redo" })
map("i", "<C-S-z>", "<C-o><C-r>", { desc = "Redo" })

-- Word-delete
map("i", "<C-BS>", "<C-W>", { noremap = true, desc = "Delete-left-word" })

-- Move line
-- No mini.move
map({ "n", "x" }, "<A-Up>", ":m .-2<CR>==", { silent = true })
map({ "n", "x" }, "<A-Down>", ":m .+1<CR>==", { silent = true })
map("i", "<A-Up>", "<Esc>:m .-2<CR>==", { silent = true })
map("i", "<A-Down>", "<Esc>:m .+1<CR>==", { silent = true })
-- With mini move
map("x", "<M-Left>", "<M-h>", { remap = true, silent = true })
map("x", "<M-Right>", "<M-l>", { remap = true, silent = true })
map({"n", "i", "v"}, "<M-Down>", "<M-j>", { remap = true, silent = true })
map({"n", "i", "v"}, "<M-Up>", "<M-k>", { remap = true, silent = true })


-- Shift-for-select -> Auto visual-mode switch
map("n", "<S-Left>", "v<Left>", { silent = true })
map("n", "<S-Right>", "v<Right>", { silent = true })
map("n", "<S-Up>", "v<Up>", { silent = true })
map("n", "<S-Down>", "v<Down>", { silent = true })

map("i", "<S-Right>", "<Esc>v<Right>i", { silent = true })
map("i", "<S-Left>", "<Esc>v<Left>i", { silent = true })
map("i", "<S-Up>", "<Esc>v<Up>i", { silent = true })
map("i", "<S-Down>", "<Esc>v<Down>i", { silent = true })

-- Visual: Inclusive mode (behave like every GUI-program rather than first character)
map("v", "<C-Right>", "e", { remap = true, silent = true })
map("v", "<C-Left>", "b", { remap = true, silent = true })

-- Insert: Inclusive mode (ditto)
map("i", "<C-Right>", "<Esc>ea", { silent = true }) -- Unfortunate side effect: uh, it will flash in/out 1 frame for i -> normal -> a


-- Copy-paste
map("n", "<C-c>", "yy", { silent = true })
map("v", "<C-c>", '"+y', { silent = true })
map({ "i", "c" }, "<C-c>", "<Esc>", { silent = true })
map("i", "<C-v>", '<Esc>"+p<Right>i', { silent = true, desc = "Paste" })
map("c", "<C-v>", "<C-r>+", { silent = false, desc = "Paste-on-command-mode" })
map("n", "<C-v>", '"+p<Right>', { silent = true })
map("n", "<C-x>", '"+dd', { silent = true })
map("v", "<C-x>", '"+x', { silent = true })

-- In-place fast (newline|backspace|delete|tab) -> insert
map("n", "<CR>", "i<CR>", { silent = true })
map("v", "<CR>", "c<CR>", { silent = true })
map("n", "<BS>", "i<BS>", { silent = true })
map("v", "<BS>", "c<BS>", { silent = true })
map("n", "<Del>", "i<Del>", { silent = true })
map("v", "<Del>", "c<Del>", { silent = true })
map("n", "<Tab>", ">>i", { silent = true })
map("n", "<S-Tab>", "<<i", { silent = true })


-- Project navigation -> Telescope plugin: Fuzzy finder
map("n", "<C-t>", LazyVim.pick("files"), { silent = true })
map("v", "<C-t>", LazyVim.pick("files"), { silent = true })

-- Buffer cycling & close
map("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>",  { silent = true })
map("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<CR>",  { silent = true })

-- Paste/delete without yank
map({"v", "n"}, "d", '"_d', { noremap = true, silent = true })
map({"v", "n"}, "c", '"_c', { noremap = true, silent = true })
map("x", "p", "P", { desc = "Paste-without-yank" })

-- Terminal
map("n", "<c-`>", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "LazyVim-override-terminal" })
map("t", "<C-`>", "<cmd>close<cr>", { desc = "LazyVim-override-hide-terminal" })

-- Commenting
map("n", "<C-/>", "gcc", { remap = true, silent = true, desc = "Toggle-comment" })
map("i", "<C-/>", "<C-o>gcc", { remap = true, silent = true, desc = "Toggle-comment" })
map("v", "<C-/>", "gcc<Esc>", { remap = true, silent = true, desc = "Toggle-comment" })


-- Remapping full -> half page scroll + <C-(S)-d> to * & #
-- map("n", "<C-f>", "<C-d>", { silent = true, desc = "Half-page-scroll-forward" })
-- map("n", "<C-b>", "<C-u>", { silent = true, desc = "Half-page-scroll-backward" })
-- map("n", "<C-d>", "*", { silent = true, desc = "Quick-search-forward" })
-- map("n", "<C-S-d>", "#", { silent = true, desc = "Quick-search-backward" })

-- LSP - Rename
map("n", "<F2>", "<leader>cr", { remap = true, silent = true, desc = "LSP-refactor-rename" })
map("i", "<F2>", "<C-o><leader>cr", { remap = true, silent = true, desc = "LSP-refactor-rename" })

-- LSP - Goto definition
map("n", "<F12>", "gd", { remap = true, silent = true, desc = "Goto-definition" })
map("i", "<F12>", "<C-o>gd", { remap = true, silent = true, desc = "Goto-definition" })

-- LSP - Normal mode: Trigger suggestion and switch to insert mode
map("n", "<C-Space>", function()
    vim.api.nvim_feedkeys("i", 'm', true)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-Space>", true, false, true), 'm', false)
end, { silent = true })
map("n", "<C-.>", "<Space>ca", { remap = true, silent = true, desc = "Code-action" })
map("i", "<C-.>", "<C-o><Space>ca", { remap = true, silent = true, desc = "Code-action" })

-- Weird unmapped keys
map("v", "<S-Up>", "<Up>", { silent = true, desc = "Defaulted-to-up" })
map("v", "<S-Down>", "<Down>", { silent = true, desc = "Defaulted-to-down" })
map("i", "<S-Tab>", "<C-o><<", { silent = true, desc = "De-indent" })
map("v", "<Tab>", ">gv", { silent = true, desc = "Indent-on-visual"})
map("v", "<S-Tab>", "<gv", { silent = true, desc = "De-indent-on-visual"})

-- Overriding LazyVim window adjustment keybind to more "natural" GUI-way: Cursor motion in insert mode
-- Eyeballing + mouse for window management is much better anyway, as long as the emulator supports it
map("n", "<C-Up>", "{", { silent = true, desc = "GUI-way-move-previous-paragraph" })
map("n", "<C-Down>", "}", { silent = true, desc = "GUI-way-move-next-paragraph" })
map("n", "<C-Left>", "b", { silent = true, desc = "GUI-way-move-previous-inclusive-word" })
map("n", "<C-Right>", "e", { silent = true, desc = "GUI-way-move-next-inclusive-word" })

-- LazyVim: Buffer
map("n", "<C-b>", "<leader>b", { remap = true, silent = true, desc = "Trigger-buffer-menu" })

-- Terminal pasting
map("t", "<C-S-v>", "<C-Bslash><C-o>p", { silent = true, desc = "Terminal-paste" })

-- Side-scrolling
vim.api.nvim_set_keymap("x", "<s-scrollwheelup>", "5zh", { noremap = true, desc = "side-scroll-right" })
vim.api.nvim_set_keymap("x", "<s-scrollwheeldown>", "5zl", { noremap = true, desc = "side-scroll-left" })

vim.api.nvim_set_keymap("n", "<s-scrollwheelup>", "5zh", { noremap = true, desc = "side-scroll-right" })
vim.api.nvim_set_keymap("n", "<s-scrollwheeldown>", "5zl", { noremap = true, desc = "side-scroll-left" })

vim.api.nvim_set_keymap("i", "<s-scrollwheelup>", "<c-o>5zh", { noremap = true, desc = "side-scroll-right" })
vim.api.nvim_set_keymap("i", "<S-ScrollWheelDown>", "<C-O>5zl", { noremap = true, desc = "Side-scroll-left" })

-- Dial Plugin: Increment / Decrement
map("n", "<C-a>", function() require("dial.map").manipulate("increment", "normal") end)
map("n", "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end)
map("x", "<C-a>", function() require("dial.map").manipulate("increment", "visual") end)
map("x", "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end)

map("n", "<C-l>", function() require("dial.map").manipulate("decrement", "normal") end)
map("n", "g<C-l>", function() require("dial.map").manipulate("decrement", "gnormal") end)
map("x", "<C-l>", function() require("dial.map").manipulate("decrement", "visual") end)
map("x", "g<C-l>", function() require("dial.map").manipulate("decrement", "gvisual") end)

-- Select mode: Exit
map("s", "<Esc>", "<C-o><Esc>", { remap = true, desc = "exit-select-mode" })
