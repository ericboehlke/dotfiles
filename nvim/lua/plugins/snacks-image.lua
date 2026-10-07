-- Inline images and mermaid diagrams in Markdown buffers (Ghostty, kitty graphics protocol).
-- Needs `mmdc` (npm -g @mermaid-js/mermaid-cli) and ImageMagick.
return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      convert = {
        mermaid = function()
          local theme = vim.o.background == "light" and "neutral" or "dark"
          return {
            "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "{scale}",
            "-p", vim.fn.expand("~/.config/mermaid/puppeteer.json"), -- use system Chromium
          }
        end,
      },
    },
  },
}
