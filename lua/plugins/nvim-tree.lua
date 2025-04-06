
return {

{
  "yao1818/nvim-tree.lua",
  branch = "dev",
  version = "*",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function()
    require("nvim-tree").setup {
--    open_on_setup = true,
--    open_on_setup_file = false,
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 30,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        hide_root_folder = false,
        -- 自定义列表中快捷键
        mappings = {
            custom_only = false,
            list = {
              -- 打开文件或文件夹
              --{ key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
              -- 分屏打开文件
              { key = "v", action = "vsplit" },
              { key = "h", action = "split" },
              -- 显示隐藏文件
              { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
              { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
              -- 文件操作
              { key = "<F5>", action = "refresh" },
              { key = "a", action = "create" },
              { key = "d", action = "remove" },
              { key = "r", action = "rename" },
              { key = "x", action = "close_node" },
              { key = "c", action = "copy" },
              { key = "p", action = "paste" },
              { key = "s", action = "system_open" },
            },
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = false,
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'wsl-open', -- mac 直接设置为 open
    },
--    icons = {
--        symlink_arrow = "*",
--    },
    renderer = {
      indent_markers = {   --缩进标志
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = false,
        show = {
            folder_arrow = true,
            file = false,
            folder = false,
            git = true,
        },
        glyphs = {
            symlink = "•", --•➜
            folder = {
                arrow_closed = "▶",
                arrow_open = "▽",   -- ∨ ▽ ▷ ▶  ◆ ◇
            },
            git = {
              unstaged = "[M]",  -- Modified
              staged = "[+]",    -- Staged
              unmerged = "[!]",  -- Conflict
              renamed = "[R]",   -- Renamed
              untracked = "[?]", -- Untracked
              deleted = "[D]",   -- Deleted
              ignored = "[ ]",   -- Ignored
            },

        },
      },
    },

    }
  end
}

}
