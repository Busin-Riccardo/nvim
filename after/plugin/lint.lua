local lint = require"lint"

lint.linters_by_ft = {
    typescript = {"eslint_d"},
    typescriptreact = {"eslint_d"},
    javascript = {"eslint_d"},
    javascriptreact = {"eslint_d"},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    desc = "Lint on save",
    callback = function ()
        lint.try_lint()
    end
})
