local lint = require("lint")
local debounce = require("utils.debounce")

local severities = {
    vim.diagnostic.severity.WARN,
    vim.diagnostic.severity.ERROR,
}

lint.linters_by_ft = {
    typescript = { "eslint" },
    typescriptreact = { "eslint" },
    javascript = { "eslint" },
    javascriptreact = { "eslint" },
}

vim.api.nvim_create_autocmd({ "TextChanged" }, {
    desc = "Lint on change",
    callback = debounce.debounce_leading(function()
        lint.try_lint()
    end, 500),
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    desc = "Lint on save",
    callback = function()
        lint.try_lint()
    end,
})
