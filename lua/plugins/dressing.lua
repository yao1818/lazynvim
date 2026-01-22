return {
  "stevearc/dressing.nvim",
  opts = {
    input = {
      enabled = false, -- 禁用输入窗口，使用原生 vim.ui.input
    },
    select = {
      enabled = true,
      backend = { "telescope", "builtin" },
      builtin = {
        relative = "editor",
        win_options = {
          winblend = 0,
        },
      },
    },
  },
}
