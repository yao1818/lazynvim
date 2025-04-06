return {
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
    opts = {
      enhanced_diff_hl = true, -- 高亮差异行
      hooks = {
      diff_buf_read = function()
      vim.cmd("setlocal winhighlight=Normal:DiffviewNormal")
      end,
      },
      -- 默认配置（参考 :h diffview-config）
      view = {
        merge_tool = {
          layout = "diff3_mixed", -- 合并冲突时的布局
        },
      },
    },

    use_icons = true,         -- Requires nvim-web-devicons
    show_help_hints = true,   -- Show hints for how to open the help panel
    watch_index = true,       -- Update views and index buffers when the git index changes.
    icons = {                 -- Only applies when use_icons is true.
      folder_closed = "▶",
      folder_open = "▽",
    },
    signs = {
      fold_closed = "▶",
      fold_open = "▽",
      done = "✓",
    },

  },
}
