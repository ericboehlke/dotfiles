-- Renders fenced ```mermaid blocks inline in Markdown buffers (Ghostty / kitty graphics, works through tmux
-- with `allow-passthrough on`). Needs `mmdc` and ImageMagick. snacks.nvim image can't do fenced mermaid.
return {
  {
    "3rd/image.nvim",
    lazy = true,
    opts = {
      backend = "kitty",
      processor = "magick_cli",
      integrations = { markdown = { enabled = false } }, -- plain images stay with snacks.nvim
      max_height_window_percentage = 60,
      tmux_show_only_in_active_window = true,
    },
  },
  {
    "3rd/diagram.nvim",
    ft = { "markdown" },
    dependencies = { "3rd/image.nvim" },
    opts = function()
      return {
        integrations = { require("diagram.integrations.markdown") },
        renderer_options = {
          mermaid = {
            background = "transparent",
            theme = "dark",
            scale = 2,
            cli_args = { "-p", vim.fn.expand("~/.config/mermaid/puppeteer.json") },
          },
        },
      }
    end,
  },
}
