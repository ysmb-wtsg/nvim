local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
  return
end

local typescript_setup, typescript = pcall(require, 'typescript')
if not typescript_setup then
  return
end

local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set('n', 'gf', '<cmd>Lspsaga finder def+ref ++normal<CR>', opts)
  keymap.set('n', 'gd', '<cmd>Lspsaga hover_doc<CR>', opts)
  keymap.set('n', 'go', '<cmd>Lspsaga outline<CR>', opts)
  keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)

  if client.name == 'tsserver' then
    keymap.set('n', '<leader>rf', ':TypescriptRenameFile<CR>')
  end
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig['html'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

lspconfig['cssls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig['tailwindcss'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


lspconfig['lua_ls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize 'vim' global
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
    },
  },
})

lspconfig['pyright'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig['gopls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig['angularls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig['docker_compose_language_service'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig['intelephense'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
