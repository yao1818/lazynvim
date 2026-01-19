根据 `config.lua` 文件，这是一个 Neovim 插件 **Avante** 的高亮配置文件。以下是配置边框样式、背景颜色等的详细说明：

## 配置方式

### 1. 在您的 Neovim 配置中自定义高亮

您可以在您的 Neovim 配置文件（通常是 `~/.config/nvim/init.lua`）中添加以下配置：

```lua
require('avante').setup({
  -- 其他配置...
  highlights = {
    -- 自定义差异高亮（冲突颜色）
    diff = {
      current = "DiffAdd",      -- 当前版本的背景色
      incoming = "DiffChange",   -- 传入版本的背景色
    },
  },
})
```

### 2. 直接覆盖高亮组

您可以直接在配置中使用 `vim.api.nvim_set_hl` 来设置特定的颜色：

```lua
-- 设置侧边栏边框样式
vim.api.nvim_set_hl(0, 'AvantePromptInputBorder', {
  fg = '#56b6c2',      -- 前景色（边框颜色）
  bg = '#1e222a',      -- 背景色
  sp = '#56b6c2',      -- 特殊颜色（用于边框）
  blend = 0,           -- 混合程度
  bold = false,        -- 粗体
  italic = false,      -- 斜体
  undercurl = false,   -- 下划线
  underline = false,   -- 下划线
  strikethrough = false, -- 删除线
  reverse = false,     -- 反色
})

-- 设置侧边栏背景
vim.api.nvim_set_hl(0, 'AvanteSidebarNormal', {
  fg = '#ABB2BF',
  bg = '#1e222a',
})

-- 设置标题样式
vim.api.nvim_set_hl(0, 'AvanteTitle', {
  fg = '#1e222a',     -- 深色文字
  bg = '#98c379',     -- 绿色背景
  bold = true,        -- 粗体
})
```

## 主要可配置的高亮组

### 输入框和边框相关

```lua
-- 输入框
vim.api.nvim_set_hl(0, 'AvantePromptInput', {
  bg = '#1e222a',     -- 输入框背景色
  fg = '#ABB2BF',     -- 输入框文字颜色
})

-- 输入框边框
vim.api.nvim_set_hl(0, 'AvantePromptInputBorder', {
  fg = '#56b6c2',     -- 边框颜色
  link = 'NormalFloat', -- 或链接到其他高亮组
})
```

### 侧边栏相关

```lua
-- 侧边栏分隔符
vim.api.nvim_set_hl(0, 'AvanteSidebarWinSeparator', {
  fg = '#3e4452',     -- 分隔符颜色
  bg = '#1e222a',     -- 分隔符背景
})

-- 水平分隔符
vim.api.nvim_set_hl(0, 'AvanteSidebarWinHorizontalSeparator', {
  fg = '#3e4452',     -- 水平分隔符颜色
  bg = '#1e222a',     -- 背景色
})

-- 侧边栏正常文本
vim.api.nvim_set_hl(0, 'AvanteSidebarNormal', {
  fg = '#ABB2BF',     -- 文本颜色
  bg = '#1e222a',     -- 背景色
})
```

### 按钮样式

```lua
-- 默认按钮
vim.api.nvim_set_hl(0, 'AvanteButtonDefault', {
  fg = '#1e222a',     -- 文字颜色
  bg = '#ABB2BF',     -- 按钮背景
})

-- 默认按钮悬停
vim.api.nvim_set_hl(0, 'AvanteButtonDefaultHover', {
  fg = '#1e222a',     -- 文字颜色
  bg = '#a9cf8a',     -- 悬停背景（浅绿色）
})

-- 主要按钮
vim.api.nvim_set_hl(0, 'AvanteButtonPrimary', {
  fg = '#1e222a',
  bg = '#ABB2BF',
})

-- 主要按钮悬停
vim.api.nvim_set_hl(0, 'AvanteButtonPrimaryHover', {
  fg = '#1e222a',
  bg = '#56b6c2',     -- 青色悬停效果
})

-- 危险按钮
vim.api.nvim_set_hl(0, 'AvanteButtonDanger', {
  fg = '#1e222a',
  bg = '#ABB2BF',
})

-- 危险按钮悬停
vim.api.nvim_set_hl(0, 'AvanteButtonDangerHover', {
  fg = '#1e222a',
  bg = '#e06c75',     -- 红色悬停效果
})
```

### 标题和副标题

```lua
-- 主标题
vim.api.nvim_set_hl(0, 'AvanteTitle', {
  fg = '#1e222a',     -- 深色文字
  bg = '#98c379',     -- 绿色背景
  bold = true,        -- 粗体
})

-- 反转标题
vim.api.nvim_set_hl(0, 'AvanteReversedTitle', {
  fg = '#98c379',     -- 绿色文字
  bg_link = 'NormalFloat', -- 链接到正常浮窗背景
})

-- 副标题
vim.api.nvim_set_hl(0, 'AvanteSubtitle', {
  fg = '#1e222a',     -- 深色文字
  bg = '#56b6c2',     -- 青色背景
})

-- 三级标题
vim.api.nvim_set_hl(0, 'AvanteThirdTitle', {
  fg = '#ABB2BF',     -- 浅色文字
  bg = '#353B45',     -- 深灰色背景
})
```

### 状态指示器

```lua
-- 生成中状态
vim.api.nvim_set_hl(0, 'AvanteStateSpinnerGenerating', {
  fg = '#1e222a',
  bg = '#ab9df2',     -- 紫色
})

-- 思考状态
vim.api.nvim_set_hl(0, 'AvanteStateSpinnerThinking', {
  fg = '#1e222a',
  bg = '#c678dd',     -- 深紫色
})

-- 成功状态
vim.api.nvim_set_hl(0, 'AvanteStateSpinnerSucceeded', {
  fg = '#1e222a',
  bg = '#98c379',     -- 绿色
})

-- 失败状态
vim.api.nvim_set_hl(0, 'AvanteStateSpinnerFailed', {
  fg = '#1e222a',
  bg = '#e06c75',     -- 红色
})
```

## 完整配置示例

```lua
require('avante').setup({
  behaviour = {
    auto_set_highlight_group = true,  -- 自动设置高亮组
  },
  highlights = {
    diff = {
      current = "DiffAdd",      -- 当前版本使用 DiffAdd 颜色
      incoming = "DiffChange",  -- 传入版本使用 DiffChange 颜色
    },
  },
})

-- 自定义高亮组（可选）
local custom_colors = {
  bg = '#1e222a',           -- 深色背景
  fg = '#ABB2BF',           -- 浅色文字
  accent = '#56b6c2',       -- 青色强调
  success = '#98c379',      -- 绿色成功
  danger = '#e06c75',       -- 红色危险
  purple = '#c678dd',       -- 紫色
}

-- 应用自定义颜色
vim.api.nvim_set_hl(0, 'AvantePromptInputBorder', {
  fg = custom_colors.accent,
  bg = custom_colors.bg,
})

vim.api.nvim_set_hl(0, 'AvanteSidebarNormal', {
  fg = custom_colors.fg,
  bg = custom_colors.bg,
})
```

## 使用链接简化配置

如果您想使用现有主题的颜色，可以使用 `link` 参数：

```lua
-- 链接到现有高亮组
vim.api.nvim_set_hl(0, 'AvantePromptInputBorder', {
  link = 'FloatBorder'     -- 使用浮动窗口边框样式
})

vim.api.nvim_set_hl(0, 'AvanteSidebarNormal', {
  link = 'NormalFloat'      -- 使用正常浮动窗口样式
})
```


-- 配置源码解决ICON问题的DIFF

yao:~/.local/share/nvim/lazy/avante.nvim$ git status
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   lua/avante/highlights.lua
        modified:   lua/avante/sidebar.lua

no changes added to commit (use "git add" and/or "git commit -a")
yao:~/.local/share/nvim/lazy/avante.nvim$ git diff
diff --git a/lua/avante/highlights.lua b/lua/avante/highlights.lua
index b061f6c..85fde64 100644
--- a/lua/avante/highlights.lua
+++ b/lua/avante/highlights.lua
@@ -6,12 +6,12 @@ local bit = require("bit")
 local rshift, band = bit.rshift, bit.band

 local Highlights = {
-  TITLE = { name = "AvanteTitle", fg = "#1e222a", bg = "#98c379" },
-  REVERSED_TITLE = { name = "AvanteReversedTitle", fg = "#98c379", bg_link = "NormalFloat" },
-  SUBTITLE = { name = "AvanteSubtitle", fg = "#1e222a", bg = "#56b6c2" },
-  REVERSED_SUBTITLE = { name = "AvanteReversedSubtitle", fg = "#56b6c2", bg_link = "NormalFloat" },
-  THIRD_TITLE = { name = "AvanteThirdTitle", fg = "#ABB2BF", bg = "#353B45" },
-  REVERSED_THIRD_TITLE = { name = "AvanteReversedThirdTitle", fg = "#353B45", bg_link = "NormalFloat" },
+  TITLE = { name = "AvanteTitle", fg = "#b8bb50", bg = "#1D2021" },
+  REVERSED_TITLE = { name = "AvanteReversedTitle", fg = "#b8bb50", bg = "#1D2021" },
+  SUBTITLE = { name = "AvanteSubtitle", fg = "#b8bb50", bg = "#1D2021" },
+  REVERSED_SUBTITLE = { name = "AvanteReversedSubtitle", fg = "#b8bb50", bg = "#1D2021" },
+  THIRD_TITLE = { name = "AvanteThirdTitle", fg = "#b8bb50", bg = "#1D2021" },
+  REVERSED_THIRD_TITLE = { name = "AvanteReversedThirdTitle", fg = "#b8bb50", bg = "#1D2021" },
   SUGGESTION = { name = "AvanteSuggestion", link = "Comment" },
   ANNOTATION = { name = "AvanteAnnotation", link = "Comment" },
   POPUP_HINT = { name = "AvantePopupHint", link = "NormalFloat" },
diff --git a/lua/avante/sidebar.lua b/lua/avante/sidebar.lua
index e696f33..e377f44 100644
--- a/lua/avante/sidebar.lua
+++ b/lua/avante/sidebar.lua
@@ -1001,9 +1001,9 @@ function Sidebar:render_header(winid, bufnr, header_text, hl, reverse_hl)
   local function format_segment(text, highlight) return "%#" .. highlight .. "#" .. text end

   if Config.windows.sidebar_header.rounded then
-    header_text = format_segment(Utils.icon("", "『"), reverse_hl)
+    header_text = format_segment(Utils.icon("▸ ", "『"), reverse_hl)
       .. format_segment(header_text, hl)
-      .. format_segment(Utils.icon("", "』"), reverse_hl)
+      .. format_segment(Utils.icon(" ◂", "』"), reverse_hl)
   else
     header_text = format_segment(" " .. header_text .. " ", hl)
   end
@@ -1024,7 +1024,7 @@ end

 function Sidebar:render_result()
   if not Utils.is_valid_container(self.containers.result) then return end
-  local header_text = Utils.icon("󰭻 ") .. "Avante"
+  local header_text = Utils.icon("") .. "Avante"
   self:render_header(
     self.containers.result.winid,
     self.containers.result.bufnr,
@@ -1040,15 +1040,15 @@ function Sidebar:render_input(ask)
   if not Utils.is_valid_container(self.containers.input) then return end

   local header_text = string.format(
-    "%s%s (" .. Config.mappings.sidebar.switch_windows .. ": switch focus)",
-    Utils.icon("󱜸 "),
-    ask and "Ask" or "Chat with"
+    "%s%s",
+    Utils.icon(""),
+    ask and "Ask windows" or "Chat with"
   )

   if self.code.selection ~= nil then
     header_text = string.format(
       "%s%s (%d:%d) (%s: switch focus)",
-      Utils.icon("󱜸 "),
+      Utils.icon(""),
       ask and "Ask" or "Chat with",
       self.code.selection.range.start.lnum,
       self.code.selection.range.finish.lnum,
@@ -3332,11 +3332,11 @@ function Sidebar:create_selected_files_container()

     local project_path = Utils.root.get()
     for i, filepath in ipairs(selected_filepaths_) do
-      local icon, hl = Utils.file.get_file_icon(filepath)
+      local icon = "▸"
+      local hl = ""
       local renderpath = PPath:new(filepath):normalize(project_path)
       local formatted_line = string.format("%s %s", icon, renderpath)
       table.insert(lines_to_set, formatted_line)
-      if hl and hl ~= "" then table.insert(highlights_to_apply, { line_nr = i, icon = icon, hl = hl }) end
     end

     local selected_files_count = #lines_to_set ---@type integer
@@ -3363,7 +3363,7 @@ function Sidebar:create_selected_files_container()
       selected_files_buf,
       string.format(
         "%sSelected (%d file%s)",
-        Utils.icon(" "),
+        Utils.icon(""),
         selected_files_count,
         selected_files_count > 1 and "s" or ""
       ),
@@ -3482,7 +3482,7 @@ function Sidebar:create_todos_container()
   self:render_header(
     self.containers.todos.winid,
     todos_buf,
-    Utils.icon(" ") .. "Todos" .. " (" .. done_count .. "/" .. total_count .. ")",
+    Utils.icon("") .. "Todos" .. " (" .. done_count .. "/" .. total_count .. ")",
     Highlights.SUBTITLE,
     Highlights.REVERSED_SUBTITLE
   )
