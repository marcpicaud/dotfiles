-- File reload
vim.api.nvim_create_autocmd(
  { "FocusGained", "BufEnter", "CursorHold" },
  { command = "checktime" }
)

-- Formatting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "set formatoptions-=ro",  -- No automatic comment insertion
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
