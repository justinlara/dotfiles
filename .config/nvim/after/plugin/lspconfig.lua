-- Default to diagnostic text being enabled, and add a command to toggle it on
-- and off for when it's getting annoying.
vim.diagnostic.config {
  virtual_text = true,
  underline = true,
  signs = true,
}

vim.api.nvim_create_user_command("DiagnosticToggle", function()
    local config = vim.diagnostic.config
    local vt = config().virtual_text
    config {
        virtual_text = not vt,
        underline = not vt,
        signs = true,
    }
end, { desc = "toggle diagnostic" })

-- Keybindings
vim.keymap.set('n', '<leader>dt', '<cmd>DiagnosticToggle<cr>', { noremap = true })
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true })


--local lspconfig = require('lspconfig')
local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    --require('cmp_nvim_lsp').default_capabilities(),
    { semanticTokensProvider = nil }
)
vim.lsp.config('ts_ls', {
    on_init = function(client, initialization_result)
        if client.server_capabilities then
            -- This causes the syntax highlighting to change if enabled
            client.server_capabilities.semanticTokensProvider = false
        end
    end,
    capabilities = capabilities,
    settings = {
        diagnostics = {
            -- Ignore Type annotation can only be used in TypeScript file warning
            ignoredCodes = {8010}
        }
    }
})
vim.lsp.enable('ts_ls')

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    if not base_on_attach then return end

    base_on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
})
vim.lsp.enable('eslint')

-- lspconfig.eslint.setup({capabilities = capabilities})
vim.lsp.config('ruby_lsp', {
    capabilities = capabilities,
    init_options = {
        addonSettings = {
            ["Ruby LSP Rails"] = {
                enablePendingMigrationsPrompt = false,
            },
        },
    },
})
vim.lsp.enable('ruby_lsp')
