-- custom/configs/null-ls.lua

local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

-- Put more from [here](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting) as needed
local sources = {
  -- formatting.prettierd,
  -- formatting.stylua,
  formatting.beautysh,
  formatting.clang_format,
  -- formatting.black,
  formatting.fixjson,
  -- formatting.format_r,
  formatting.htmlbeautifier,
  formatting.stylua,
  formatting.markdownlint,
  -- formatting.mdformat,
  -- formatting.stylelint,
  -- formatting.styler,
  formatting.asmfmt,

  code_actions.shellcheck,

  lint.shellcheck,
  lint.checkmake,
  -- lint.checkstyle,
  -- lint.chktex,
  -- lint.jsonlint,
  -- lint.jshint,
  -- lint.markuplint,
  lint.todo_comments,
  lint.tsc,
  lint.zsh,

  hover.printenv,
}

-- Just how it works [https://github.com/lukas-reineke/lsp-format.nvim/issues/70#issuecomment-1380102889]
local on_attach = function(client, _)
  require("lsp-format").on_attach(client)
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
  -- on_init = function(new_client, _)
  --   new_client.offset_encoding = 'utf-32'
  -- end,
}
