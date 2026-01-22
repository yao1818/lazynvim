-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
--vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
--vim.wo.colorcolumn = "80"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = true
-- 边输入边搜索
vim.o.incsearch = false
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 1
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = true
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 200
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
-- vim.o.list = true
-- vim.o.listchars = "space:·"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 0
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false
-- 配置剪切板
-- vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard:append("unnamedplus")
--vim.g.clipboard = {
--    name =  'myClipboard',
--
--
--}
vim.g.mkdp_browser = '/usr/bin/google-chrome'   -- /usr/bin/firefox   /usr/bin/google-chrome
vim.g.vim_markdown_folding_disabled = 1
vim.g.mkdp_command_for_global = 1
vim.g.mkdp_open_ip = '127.0.0.1'
vim.g.mkdp_theme = 'dark'

vim.opt.tags = { './tags', 'tags' }  -- 搜索 tags 文件的位置

vim.opt.smoothscroll = true
vim.opt.scrolloff = 8         -- 保持光标距离顶部/底部的行数
vim.opt.mousescroll = "ver:1" -- 鼠标滚轮步长

-- 所有删除操作使用黑洞寄存器
vim.keymap.set('n', 'd', '"_d', { noremap = true })
vim.keymap.set('v', 'd', '"_d', { noremap = true })

-- 自动关闭 NvimTree 功能
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

--  -- 创建自动命令组（用于统一管理相关事件）
--  local trim_whitespace_augroup = vim.api.nvim_create_augroup("AutoTrimWhitespace", { clear = true })
--
--  -- 注册 BufWritePre 事件监听器
--  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--      pattern = "*",               -- 匹配所有文件类型
--      command = [[:%s/\s\+$//e]],   -- &#9989; 使用原始字符串避免转义问题
--      group = trim_whitespace_augroup,
--  })


-- 配置Windows远程连接Linux时，打开nvim可以复制内容到Windows的剪切板
--vim.g.clipboard = {
--  name = 'OSC 52',
--  copy = {
--    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
--    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
--  },
--  paste = {
--    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
--    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
--  },
--}
-- （可选）让无名寄存器直接与系统剪贴板联动
-- vim.opt.clipboard:append('unnamedplus')

--vim.opt.foldtext = "v:lua.require('utils.simple_fold').simple_fold()"


-- Avante 插件外观配置
vim.api.nvim_set_hl(0, 'AvanteSidebarWinSeparator', {
  fg = '#504945',     -- 分隔符颜色
  bg = '#1D2021',     -- 分隔符背景
})

vim.api.nvim_set_hl(0, 'AvanteSidebarWinHorizontalSeparator', {
  fg = '#282828',     -- 水平分隔符颜色
  bg = '#1D2021',     -- 背景色
})

vim.api.nvim_set_hl(0, 'AvanteSidebarNormal', {
  fg = '#ABB2BF',
  bg = '#1D2021',
})

vim.api.nvim_set_hl(0, 'AvanteTitle', {
  fg = '#B8BB50',     -- 深色文字
  bg = '#1D2021',     -- 绿色背景
  bold = true,        -- 粗体
})

vim.api.nvim_set_hl(0, 'AvanteSubtitle', {
  fg = '#B8BB50',     -- 深色文字
  bg = '#1D2021',     -- 青色背景
  bold = true,        -- 粗体
})

vim.api.nvim_set_hl(0, 'AvanteThirdTitle', {
  fg = '#B8BB50',     -- 浅色文字
  bg = '#1D2021',     -- 深灰色背景
  bold = true,        -- 粗体
})

vim.opt.fillchars = {
  vert = '│',        -- 垂直分隔符
  horiz = '─',       -- 水平分隔符
  verthoriz = '┼',   -- 十字分隔符
}

-- vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#2a2e33' }) -- 微蓝灰
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#272b30' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#24282d' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#21252a' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = '#1e2227' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = '#1b1f24' })

-- vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#2c2f2f' }) -- 微褐灰
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#292c2c' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#262929' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#232626' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = '#202323' })
-- vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = '#1d2020' })

vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { bg = '#32363a' }) -- 明显深灰，稳重
vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#2c3034' }) -- 稍亮
vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { bg = '#262a2e' }) -- 中等深灰
vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { bg = '#212529' }) -- 开始变浅，清晰可见
vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { bg = '#1c2024' }) -- 明显比背景亮
vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', { bg = '#181c20' }) -- 最浅，但仍是深灰（非白！）

vim.api.nvim_set_hl(0, 'RenderMarkdownBullet', { fg = '#83A598' })

