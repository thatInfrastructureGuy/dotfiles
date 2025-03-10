vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- TJ DeVries
-- https://www.youtube.com/watch?v=9gUatBHuXE0
-- https://www.youtube.com/watch?v=HlfjpstqXwE

--attach_to_buffer(24, "*.go", "go build -o app main.go && ./app")
local attach_to_buffer = function(output_buffer, pattern, commands)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("Tutorial", { clear = true }),
        pattern = pattern,
        callback = function()
            local print_data = function(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(output_buffer, -1, -1, false, data)
                end
            end

            vim.api.nvim_buf_set_lines(output_buffer, 0, -1, false, { "---AutoRun Output---" })

            vim.fn.jobstart({ "sh", "-c", commands }, {
                stdout_buffered = true,
                stderr_buffered = true,
                on_stderr = print_data,
                on_stdout = print_data,
            })
        end,
    })
end


vim.api.nvim_create_user_command("AutoRunOnSave", function()
    print "AutoRun starts now!"
    local bufnr = vim.fn.input "Bufnr: "
    local pattern = vim.fn.input "Pattern: "
    local command = vim.fn.input "Command: "
    attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})
