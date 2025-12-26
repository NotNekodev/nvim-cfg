local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local servers = { "clangd", "lua_ls" }

mason.setup()
mason_lspconfig.setup({ ensure_installed = servers, automatic_installation = true })

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

for _, name in ipairs(servers) do
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    if name == "lua_ls" then
        opts.settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = { enable = false },
            },
        }
    end

    vim.lsp.enable(name)
end
