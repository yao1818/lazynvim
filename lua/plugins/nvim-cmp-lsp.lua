

return {

{
  "hrsh7th/cmp-nvim-lsp",
  version = "*",
  config = function()
    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- The following example advertise capabilities to `clangd`.
    require'lspconfig'.clangd.setup {
      capabilities = capabilities,
    }

  end
}

}
