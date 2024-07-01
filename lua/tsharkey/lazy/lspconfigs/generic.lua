local function setup(lsps, on_attach, capabilities)
    local lspconfig = require("lspconfig")

    for _, lsp in ipairs(lsps) do
        lspconfig[lsp].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end
end

return setup 
