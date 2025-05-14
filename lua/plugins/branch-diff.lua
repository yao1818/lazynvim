return {
  {
    "branch-diff.nvim", -- 或本地路径
    dir = "/home/yao/.local/share/nvim/lazy/branch-diff.nvim", -- 如果是本地开发
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      style = "vertical",
      keymaps = {
        next_diff = "]d",
        prev_diff = "[d",
        get_change = "<leader>dg",
        put_change = "<leader>dp",
        sync_file = "<leader>ds",
        quit = "q",
      },
      border = "rounded",
    },
    cmd = "BranchDiff",
    keys = {
      { "<leader>gd", "<cmd>BranchDiff ", desc = "Branch Diff" },
    },
  },
}
