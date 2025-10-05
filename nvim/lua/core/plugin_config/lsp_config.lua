require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls" }
})

require'lspconfig'.clangd.setup{}
require('mason-lspconfig').setup({
    ensure_installed = { "pyright" }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- lua
require('lspconfig').lua_ls.setup {

    on_attach = on_attach,
    capabilities = capabilities
}
-- c/c++
require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
}

-- python
require('lspconfig').pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
     analysis = {
       autoSearchPaths = true,
       diagnosticMode = "workspace",
       useLibraryCodeForTypes = true
     }
   }
  }
}

-- typescript
local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        preferences = {
            disableSuggestion = true
        }
    }
}

--  java
 require("lspconfig").jdtls.setup({
     capabilities = capabilities,
     on_attach = on_attach,
 })
local lsp_utils = {}

-- on_attach function
local on_attach = function(_, _)
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  map('n', '<leader>rn', vim.lsp.buf.rename, opts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'gi', vim.lsp.buf.implementation, opts)
  map('n', 'gr', require('telescope.builtin').lsp_references, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
end

-- capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup mason and mason-lspconfig
require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "clangd",
    "ts_ls",
    "jdtls",
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,

    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })
    end,

    ["pyright"] = function()
      require("lspconfig").pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true
            }
          }
        }
      })
    end,

    ["ts_ls"] = function()
      require("lspconfig").ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true
          }
        }
      })
    end,

    ["jdtls"] = function()
      require("lspconfig").jdtls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,

    ["clangd"] = function()
      require("lspconfig").clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        }
      })
    end,
  }
})

