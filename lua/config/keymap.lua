vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- finding keybinds (telescope)
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find files", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live Grep", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Show Buffers", noremap = true, silent = true })

-- terminal
vim.keymap.set("n", "<leader>ct", function() vim.cmd("ToggleTerm<CR>") end, { desc = "Open floating terminal", noremap = true, silent = true})
vim.keymap.set("n", "<leader>cr", function() vim.fn.system(vim.fn.input("Command to run")) end, { desc = "Run a single command in the shell", noremap = true, silent = true })

-- git
vim.keymap.set("n", "<leader>gc", function()
    local cm = vim.fn.input("Commit Message: ")

    if cm == nil or #cm == 0 then
        vim.notify("Commit aborted: empty message", vim.log.levels.WARN, { title = "Git Commit" })
        return
    end

    local escaped_cm = cm:gsub("'", "'\\''")
    local cmd = "git commit -S -a -m '" .. escaped_cm .. "'"
    local output = vim.fn.system(cmd)

    if vim.v.shell_error == 0 then
        vim.notify(output, vim.log.levels.INFO, { title = "Git Commit" })
    else
        vim.notify(output, vim.log.levels.ERROR, { title = "Git Commit Failed" })
    end
end, { desc = "Commit your changes", noremap = true })

vim.keymap.set("n", "<leader>ga", function()
    local output = vim.fn.system("git add -A")
    if vim.v.shell_error == 0 then
        vim.notify(output ~= "" and output or "All changes staged!", vim.log.levels.INFO, { title = "Git Add" })
    else
        vim.notify(output ~= "" and output or "Failed to stage changes!", vim.log.levels.ERROR, { title = "Git Add" })
    end
end, { desc = "Add all changes", noremap = true })

vim.keymap.set("n", "<leader>gs", function()
    local pull = vim.fn.system("git pull --rebase")
    if vim.v.shell_error == 0 then
        vim.notify(pull ~= "" and pull or "Pull successful!", vim.log.levels.INFO, { title = "Git Pull" })
    else
        vim.notify(pull ~= "" and pull or "Pull failed!", vim.log.levels.ERROR, { title = "Git Pull" })
        return
    end

    local push = vim.fn.system("git push")
    if vim.v.shell_error == 0 then
        vim.notify(push ~= "" and push or "Push successful!", vim.log.levels.INFO, { title = "Git Push" })
    else
        vim.notify(push ~= "" and push or "Push failed!", vim.log.levels.ERROR, { title = "Git Push" })
    end
end, { desc = "Sync branch (pull then push)", noremap = true })


-- clipboard
vim.keymap.set("n", "<leader>c", '"+yy', { desc = "Copy current line to system clipboard", noremap = true, silent = true })
vim.keymap.set("v", "<leader>c", '"+y', { desc = "Copy current selection to system clipboard", noremap = true, silent = true })

vim.keymap.set("n", "<leader>v", '"+p', { desc = "Paste current system clipboard content", noremap = true, silent = true })
vim.keymap.set("v", "<leader>v", '"+p', { desc = "Paste current system clipboard content", noremap = true, silent = true })

vim.keymap.set("n", "<leader>x", '"+dd', { desc = "Delete current line to system keyboard", noremap = true, silent = true })
vim.keymap.set("v", "<leader>x", '"+d', { desc = "Delete current selection to system keyboard", noremap = true, silent = true })

-- buffer control
vim.keymap.set("n", "<leader>bs", ":w<CR>", { desc = "Save current buffer to disk", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", ":wq<CR>", { desc = "Save and close current buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bt", ":q!<CR>", { desc = "Closes the current buffer without saving", noremap = true, remap = true })

-- undo and redo
vim.keymap.set("n", "<leader>u", ":undo<CR>", { desc = "Undoes a change", noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", ":redo<CR>", { desc = "Redoes an undo operation", noremap = true, silent = true })

-- nvim tree
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", { desc = "Toggles NvimTree", noremap = true, silent = true })
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>", { desc = "Focuses NvimTree", noremap = true, silent = true })

-- navigation
vim.keymap.set("n", "<leader>cf", "<C-w>w", { desc = "Focuses the next window", noremap = true, silent = true })

vim.keymap.set("n", "<M-CR>", vim.lsp.buf.definition, {
    desc = "Go to definition"
})
