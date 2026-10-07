return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- Don't accept with <CR>. Use the "default" preset instead of LazyVim's
      -- "enter" preset, so <CR> always just inserts a newline.
      preset = "default",

      -- Accept the selected item.
      ["<C-y>"] = { "select_and_accept" },
    },
    completion = {
      -- Don't preselect the first item; you choose one with <C-n>/<C-p>.
      list = { selection = { preselect = false, auto_insert = true } },
    },
  },
}
