
return {

{
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons"},
  config = function()
      require("telescope").setup {

        defaults = {
          -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
          initial_mode = "insert",

          layout_strategy = "vertical", -- 可选值：horizontal, vertical, flex, center, cursor
          preview = true,  -- 确保预览启用（默认值为 true）
          layout_config = {
            horizontal = {
              height = 0.99,            -- 窗口高度接近全屏
              width = 0.95,             -- 窗口宽度接近全屏
              preview_width = 0.7,       -- 预览窗口宽度占比
              prompt_position = "bottom",   -- 输入框位置（top/bottom）
              mirror = false,            -- 是否镜像翻转布局
            },
            vertical = {
              height = 0.99,            -- 窗口高度接近全屏
              width = 0.99,             -- 窗口宽度接近全屏
              preview_cutoff = 1,       -- 即使内容很少也强制显示预览
              preview_height = 0.6,      -- 预览窗口高度占比
            },
          },
          -- path_display = { "smart" },     -- 智能缩短文件路径显示
          preview = {
            msg_bg_fillchar = " ",       -- 替换默认的消息背景填充字符（如空格或半角阴影字符）:cite[2]
            hide_on_startup = false,      -- 是否初始隐藏预览窗口
            filesize_limit = 1,           -- 文件大小限制（MB），超出则不预览
          },

          -- 窗口内快捷键
          mappings = {
            i = {
              -- 上下移动
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<Down>"] = "move_selection_next",
              ["<Up>"] = "move_selection_previous",
              -- 历史记录
              ["<C-n>"] = "cycle_history_next",
              ["<C-p>"] = "cycle_history_prev",
              -- 关闭窗口
              ["<C-c>"] = "close",
              -- 预览窗口上下滚动
              --["<C-u>"] = "preview_scrolling_up",
              --["<C-d>"] = "preview_scrolling_down",
            },
          },
        },

        extensions = {
           -- 扩展插件配置
          fzf = {
            fuzzy = true,                      -- 启用模糊匹配
            override_generic_sorter = true,    -- 覆盖默认排序
            override_file_sorter = true,       -- 覆盖文件排序
            case_mode = "smart_case",          -- 区分大小写
          },
          sorting = {
            -- 自定义排序函数
            file_sorter = function(entry)
              return entry.filename:lower() -- 按文件名小写字母排序
            end,
          },

        },
      }


    require("nvim-web-devicons").setup {
       override = {
         -- 修改 .py 文件的图标
         c = {
           icon = "",
           --color = "#F5F5F5",
           color = "#428850", -- 边框或图标颜色
           bg_color = nil, -- 透明背景
           name = "c",
         },
         cpp = {
           icon = "",
           color = "#428850",
           bg_color = "NONE", -- 透明背景
           name = "cpp",
         },
         sh = {
           icon = "󰈤",

           color = "#428850",
           name = "Python",
         },
         pl = {
           icon = "",

           color = "#428850",
           name = "pl",
         },
         cmake = {
           icon = "󱁻",

           color = "#428850",
           name = "cmake",
         },
         html = {
           icon = "",  --   󰈔    󱁻  󰧮  󰈤 

           color = "#428850",
           name = "html",
         },
         -- 修改 .js 文件的图标
         js = {
           icon = "J",
           color = "#EBDC78",
           name = "JavaScript",
         },
         -- 添加自定义文件类型
         ["config"] = {
           icon = "⚙",
           color = "#5F43E9",
           name = "Terraform",
         },
       },
    }
  end
}

}


