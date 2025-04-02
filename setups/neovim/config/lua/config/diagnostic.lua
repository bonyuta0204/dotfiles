local M = {}

function M.setup()

  -- Configure diagnostic display
  vim.diagnostic.config({
    -- Show signs in the number column
    signs = true,
    -- Show diagnostic messages as virtual text
    virtual_text = {
      -- Show source in virtual text
      source = "if_many",
      -- Prefix virtual text with signs
      prefix = "●",
    },
    -- Show diagnostic messages in a floating window on hover
    float = {
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
    -- Update diagnostics in insert mode
    update_in_insert = false,
    -- Sort diagnostics by severity
    severity_sort = true,
    -- Underline the text with diagnostic
    underline = true,
  })

  -- Diagnostic keymaps
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic float" })
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Add diagnostics to location list" })

  -- Create autocommand group for diagnostics
  local diagnostic_augroup = vim.api.nvim_create_augroup("DiagnosticGroup", { clear = true })

  -- Show diagnostics in a hover window when holding the cursor
  vim.api.nvim_create_autocmd("CursorHold", {
    group = diagnostic_augroup,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = "",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })
end

return M
