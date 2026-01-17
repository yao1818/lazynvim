return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    -- 移除 opts，改用 config 函数手动控制配置加载
    config = function()
      -- 1. 定义配置表
      local opts = {
        provider = "openai",
        auto_suggestions_provider = "openai",

        providers = {
          openai = {
            -- endpoint = "https://open.bigmodel.cn/api/coding/paas/v4",
            -- model = "GLM-4.7",
            endpoint = "https://api.deepseek.com/v1",
            model = "deepseek-coder",

            timeout = 30000,
            extra_request_body = {
              temperature = 0,
              max_tokens = 4096,
            },
          },
        },


        ask = {
          floating = false, -- Open the 'AvanteAsk' prompt in a floating window
          border = { " ", " ", " ", " ", " ", " ", " ", " " },
          start_insert = false, -- Start insert mode when opening the ask window
          ---@alias AvanteInitialDiff "ours" | "theirs"
          ---@type AvanteInitialDiff
          focus_on_apply = "ours", -- which diff to focus after applying
        },
        behaviour = {
          auto_suggestions = false,
          auto_set_highlight_group = true,
          auto_set_keymaps = true,
          auto_apply_diff_after_generation = false,
        },

        ui = {
          icon = "@",  -- 自定义图标
        },

      }

      -- 3. 强制执行 setup
      require("avante").setup(opts)
    end,

    dependencies = {
      {
        "stevearc/dressing.nvim",
        opts = {
          input = { enabled = true },
        },
      },
      -- "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      {
        "zbirenbaum/copilot.lua",
      },
    },

    build = "make",
  }
}

