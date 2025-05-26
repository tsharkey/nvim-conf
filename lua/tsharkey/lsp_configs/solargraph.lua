local M = {}

function M.setup(on_attach, capabilities)
	local solargraph_cmd = "/Users/thomassharkey/.rbenv/shims/solargraph"
  local lspconfig = require("lspconfig")
  local root_dir = lspconfig.util.root_pattern("Gemfile", ".git", ".")
  lspconfig.solargraph.setup({
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    cmd = { solargraph_cmd, "stdio" },
    root_dir = root_dir,
    settings = {
      solargraph = {
        useBundler = true,
        bundlerPath = "/Users/thomassharkey/.rbenv/shims/bundler",
        diagnostics = true,
        completion = true,
        hover = true,
        definitions = true,
        references = true,
        documentSymbol = true,
        workspaceSymbol = true,
        codeAction = true,
        signature_help = true,
        codeLens = true,
        rename = true,
        formatting = true,
      }
    },
    flags = {
      debounce_text_changes = 150,
    },
  })
end

return M
