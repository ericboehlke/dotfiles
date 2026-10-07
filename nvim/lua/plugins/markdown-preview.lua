return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
  ft = { "markdown" },
  -- The bundled mermaid is 10.2.3 (too old); overwrite it with a current build after every install/update.
  build = [[cd app && npm install && d=$(mktemp -d) && npm pack mermaid@12 --pack-destination "$d" --silent >/dev/null && tar -xzf "$d"/mermaid-*.tgz -C "$d" package/dist/mermaid.min.js && cp "$d"/package/dist/mermaid.min.js _static/mermaid.min.js && rm -rf "$d"]],
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_auto_close = 0
  end,
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", ft = "markdown", desc = "Markdown Preview (browser, mermaid)" },
  },
}
