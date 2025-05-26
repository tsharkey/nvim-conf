local M = {}

function M.setup(on_attach, capabilities)
  local lspconfig = require("lspconfig")
  lspconfig.golangci_lint_ls.setup({
    filetypes = { "go" },
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "golangci-lint-langserver" },
    root_dir = require("lspconfig").util.root_pattern(".git", "go.mod"),
    init_options = {
      command = {
        "golangci-lint",
        "run",
        "--output.json.path",
        "stdout",
        "--issues-exit-code=1",
        "--show-stats=false",
      },
    },
  })
end

return M
