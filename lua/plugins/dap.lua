return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            local dap = require("dap")
            require("dapui").setup()
            require("dap-go").setup()

            local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
            if elixir_ls_debugger ~= "" then
                dap.adapters.mix_task = {
                    type = "executable",
                    command = elixir_ls_debugger,
                }
                dap.configurations.elixir = {
                    {
                        type = "mix_task",
                        name = "mix test",
                        request = "launch",
                        task = "test",
                        taskArgs = function()
                            local r, _c = unpack(vim.api.nvim_win_get_cursor(0))
                            local program = vim.fn.expand("%") .. ":" .. r
                            vim.notify(program)
                            return { "--trace", program }
                        end,
                        -- program = function()
                        --     local r, _c = unpack(vim.api.nvim_win_get_cursor(0))
                        --     local program = "MIX_ENV=test mix test " .. vim.fn.expand("%") .. ":" .. r
                        --     vim.notify(program)
                        --     return program
                        -- end,
                        startApps = true, -- for Phoenix projects
                        projectDir = "${workspaceFolder}",
                        requireFiles = {
                            "test/**/test_helper.exs",
                            "test/**/*_test.exs",
                        },
                        debugAutoInterpretAllModules = false,
                    },
                    -- {
                    -- 	type = "mix_task",
                    -- 	name = "mix test",
                    -- 	task = "test",
                    -- 	taskArgs = { "--trace" },
                    -- 	request = "launch",
                    -- 	startApps = true, -- for Phoenix projects
                    -- 	projectDir = "${workspaceFolder}",
                    -- 	requireFiles = {
                    -- 		"test/**/test_helper.exs",
                    -- 		"test/**/*_test.exs",
                    -- 	},
                    -- 	debugAutoInterpretAllModules = false,
                    -- },
                    -- {
                    -- 	type = "mix_task",
                    -- 	name = "mix test inventory",
                    -- 	task = "test",
                    -- 	taskArgs = { "test/risto_bi/inventory_test.exs:195", "--trace" },
                    -- 	request = "launch",
                    -- 	startApps = true, -- for Phoenix projects
                    -- 	projectDir = "${workspaceFolder}",
                    -- 	requireFiles = {
                    -- 		"test/**/test_helper.exs",
                    -- 		"test/**/*_test.exs",
                    -- 	},
                    -- },
                }
            end
        end,
    },
}
