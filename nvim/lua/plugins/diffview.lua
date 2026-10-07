return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewFocusFiles", "DiffviewToggleFiles" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff view" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git file History" },
  },
  opts = {},
}
