local function setup(on_attach, capabilities)
    require("lspconfig").golangci_lint_ls.setup({
        filetypes = { "go", "gomod" },
        cmd = { "golangci-lint-langserver" },
        root_dir = require("lspconfig").util.root_pattern(".git", "go.mod"),
        init_options = {
            command = {
                "golangci-lint",
                "run",
                "--disable",
                "lll",
                "--out-format",
                "json",
                "--issues-exit-code=1",
            },
        },
    })
end

return setup
