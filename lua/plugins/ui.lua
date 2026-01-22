return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- 👇 依赖项：必须安装 Treesitter 和 图标库
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  -- 👇 关键配置：只有在打开 markdown 或 Avante 窗口时才加载插件
  ft = { "markdown", "Avante" },
  opts = {
    -- 这里可以放自定义配置，如果习惯默认风格，留空即可
    -- 例如：自定义代码块背景色等
    code = {
      sign = true, -- 在代码块左侧显示图标
      width = 'block', -- 代码块背景宽度
      --border_pad = [1,1,1,1], -- 内边距
    },
    heading = {
      enabled = true,
      atx = true,
      setext = true,
      sign = true, -- 标题显示图标
      signs = { '󰫎 ' },
      -- icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " }, -- 自定义标题图标
      icons = { "", "", "", "", "", "" }, -- 自定义标题图标
      position = 'inline',
      width = 'full',
      left_margin = { 0 },
      -- left_pad = { 0, 2, 4 },
      left_pad = { 0 },
      -- border = { true, true, false, false, false, false },
      above = '_',
      -- Used below heading for border.
      below = '_',
      -- Always use virtual lines for heading borders instead of attempting to use empty lines.
      border_virtual = false,
      -- Highlight the start of the border using the foreground highlight.
      border_prefix = false,
    },
    bullet = {
      enabled = true,
      -- 控制无序列表（- / * / +）的图标
      icons = { '•', '◦', '‣', '⁃' },  -- 按嵌套层级循环使用

      -- 可选：调整左右间距
      left_pad = 0,
      right_pad = 0,

      -- 可选：设置图标颜色（需先定义高亮组）
      highlight = 'RenderMarkdownBullet',
    },
  },
}
