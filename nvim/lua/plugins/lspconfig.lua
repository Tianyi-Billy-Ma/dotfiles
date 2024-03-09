return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        -- pyright = {},
        bashls = {},
        -- gopls = {},
        bicep = {},
        yamlls = {},
        pyright = {},
        marksman = {},
        powershell_es = {},
        -- azure_pipelines_ls = {},
        terraformls = {},
        helm_ls = {},
      },
    },
    setup = {
      ruff_lsp = function()
        require("lazyvim.util").lsp.on_attach(function(client, _)
          if client.name == "ruff_lsp" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end)
      end,
      pyright = function()
        require("lazyvim.util").lsp.on_attach(function(client, _)
          if client.name == "pyright" then
            -- disable hover in favor of jedi-language-server
            client.server_capabilities.hoverProvider = false
          end
        end)
      end,
    },
  },
}
