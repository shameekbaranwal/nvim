local neodev = require "neodev"
local mason_lspconfig = require "mason-lspconfig"
local servers = require "custom.configs.servers"
local lspconfig = require "lspconfig"

require("lsp-format").setup {}

local on_attach = function(client, bufnr)
  require("plugins.configs.lspconfig").on_attach(client, bufnr)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end

local capabilities = require("plugins.configs.lspconfig").capabilities
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.offsetEncoding = { "utf-16" }

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

-- mason_lspconfig.setup()
neodev.setup()

-- commented this out because it was causing slow startup
-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     -- added this because of an encoding error
--     -- reference : https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428#issuecomment-997234900
--     if server_name == "clangd" then
--       capabilities.offsetEncoding = { "utf-16" }
--       print "setting up clangd lsp"
--     end
--     lspconfig[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name] or {},
--     }
--   end,
-- }

for server_name, _ in pairs(servers) do
  lspconfig[server_name].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = servers[server_name] or {},
  }
end
