-- mason
require("mason").setup()

-- capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

----------------------------------------------------------
-- mason-lspconfig
----------------------------------------------------------

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "clangd",
    "ts_ls",
    "jdtls",
    "ocamllsp"
  },

  handlers = {

    -- Default handler for all servers
    function(server_name)
      require("lspconfig")[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,

    ------------------------------------------------------
    -- Custom handlers
    ------------------------------------------------------

    -- Lua
    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          }
        }
      })
    end,

    -- Python
    ["pyright"] = function()
      require("lspconfig").pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
            }
          }
        }
      })
    end,

    -- TypeScript
    ["ts_ls"] = function()
      require("lspconfig").ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          }
        }
      })
    end,

    -- Java
    ["jdtls"] = function()
      require("lspconfig").jdtls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,

    -- C/C++
    ["clangd"] = function()
      require("lspconfig").clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        },
      })
    end,

    -- OCaml
    ["ocamllsp"] = function()
      require("lspconfig").ocamllsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  }
})

