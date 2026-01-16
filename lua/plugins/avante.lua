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
            endpoint = "https://open.bigmodel.cn/api/paas/v4",
            model = "glm-4-plus",

            -- 👇 确保这里写死的是你的 Key
            api_key = "5dd7e0dc737340f4911c4623931f0479.OMYvBRrGABq1Konq",

            timeout = 30000,
            extra_request_body = {
              temperature = 0,
              max_tokens = 4096,
            },
          },
        },

        behaviour = {
          auto_suggestions = false,
          auto_set_highlight_group = true,
          auto_set_keymaps = true,
          auto_apply_diff_after_generation = false,
        },
        ui = {
          icon = "",
        }
      }

      -- 2. 【调试步骤】打印读取到的 Key 前10位，让你确认插件是否真的读到了
      local loaded_key = opts.providers.openai.api_key or "NOT_FOUND"
      print("------------------------------------------------")
      print("✅ Avante 配置已加载!")
      print("API Key 读取状态: " .. string.sub(loaded_key, 1, 10) .. "...")
      print("------------------------------------------------")

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
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      {
        "zbirenbaum/copilot.lua",
      },
    },
    build = "make",
  }
}



-- return {
--   {
--     "yetone/avante.nvim",
--     event = "VeryLazy",
--     lazy = false,
--     version = false,
--     opts = {
--       provider = "openai",
--       auto_suggestions_provider = "openai",
--
--       -- 加入这行调试，每次启动 Neovim 时会弹窗告诉你读到了什么
--
--       providers = {
--         openai = {
--           -- 【修改点】去掉末尾的 /chat/completions
--           -- 只需要填到 v4 即可，插件会自动补全
--           endpoint = "https://open.bigmodel.cn/api/paas/v4",
--
--           model = "glm-4-plus",
--           -- api_key = os.getenv("ZHIPU_API_KEY"),
--           api_key = "5dd7e0dc737340f4911c4623931f0479.OMYvBRrGABq1Konq",
--
--           timeout = 30000,
--
--           extra_request_body = {
--             temperature = 0,
--             max_tokens = 4096,
--           },
--         },
--       },
--
--       behaviour = {
--         auto_suggestions = false,
--         auto_set_highlight_group = true,
--         auto_set_keymaps = true,
--         auto_apply_diff_after_generation = false,
--       },
--       ui = {
--         icon = "",
--       }
--     },
--
--
--
--
--     dependencies = {
--       {
--         "stevearc/dressing.nvim",
--         opts = {
--           -- 强制 dressing 接管 input，解决密码遮罩问题
--           input = {
--             enabled = true,
--             default_prompt = "➤ ",
--             win_options = {
--               winblend = 0, -- 透明度
--             },
--           },
--         },
--       },
--       "nvim-lua/plenary.nvim",
--       "MunifTanjim/nui.nvim",
--       "hrsh7th/nvim-cmp",
--       {
--         "zbirenbaum/copilot.lua",
--       },
--     },
--     build = "make",
--   }
--
--
-- }

