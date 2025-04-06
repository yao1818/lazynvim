-- Config nvim key bindings


-- key leader
vim.g.mapleader = " "
-- vim.g.maplocalleader = ""

-- 保存本地变量
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

local var

map("n", "c-i", "", opt)
-- 取消 s 默认功能
map("n", "s", "", opt)
-- 分屏快捷键
map("n", "vs", ":vsp<CR>", opt)

map("n", "vh", ":sp<CR>", opt)
-- 关闭当前
map("n", "vc", "<C-w>c", opt)
-- 关闭其他
map("n", "va", "<C-w>o", opt)
-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- 关闭高亮
map("n", "gs", ":noh<CR>", opt)
map("n", "GS", ":noh<CR>", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
-- map("n", "s,", ":vertical resize -20<CR>", opt)
-- map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
-- map("n", "sj", ":resize +10<CR>", opt)
-- map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

map("n", "<C-space>", "", opt)


-- Terminal相关
map("n", "<C-t>", ":terminal<CR>", opt)
map("n", "<C-vt>", ":vsp | terminal<CR>", opt)
map("t", "<A-b>", "<C-\\><C-n>", opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
-- map("v", "<", "<gv", opt)
-- map("v", ">", ">gv", opt)
-- 上下移动选中文本
-- map("v", "J", ":move '>+1<CR>gv-gv", opt)
-- map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
--map("n", "<C-j>", "4j", opt)
--map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- -- norm 模式下设置 - 为调到行尾， 默认0位调到行首
-- map("n", "-", "$", opt)

-- Tab+l:光标移动文档尾  Tab+h:光标移动文档头 **<c-i> 为Tab键值**
map("n", "<c-i>l", "$", opt)
map("n", "<c-i>h", "0", opt)

-- 输入模式下bb映射为退出输入模式
-- map("i", "bb", "<Esc>", opt)
-- map("i", "BB", "<Esc>", opt)

map("i", "<C-i>", "<Esc>", opt)
map("i", "<C-I>", "<Esc>", opt)

-- norm模式下space代表输入命令
map("n", "<space>", ":", opt)

--map("c", "W", "w", opt)
-- 取消norm模式下大写 J H K L 触发的功能，防止误触发
map("n", "J", "", opt)
map("n", "H", "", opt)
map("n", "K", "", opt)
map("n", "L", "", opt)

-- 取消virtual模式下大写 J 触发的功能，防止误触发
map("v", "J", "", opt)

-- 打开 函数变量名预览 类似TagList功能
map("n", "<c-i>f", ":SymbolsOutline<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- 搜索buffer
map("n", "<C-g>", ":Telescope buffers<CR>", opt)

map("n", "<c-i>m", ":MarkdownPreview<CR>", opt)

map("i", "<C-f>", "<Esc>/<+><CR>:nohlsearch<CR>c4l", opt)
map("i", "<C-b>", "**** <+><Esc>F*hi", opt)
map("i", "<C-s>", "~~~~ <+><Esc>F~hi", opt)
map("i", "<C-o>", "** <+><Esc>F*i", opt)
map("i", "<C-d>", "`` <+><Esc>F`i", opt) -- 行内代码
map("i", "<C-c>", "```<Enter><+><Enter>```<Enter><Enter><+><Esc>4kA", opt)
map("i", "<C-y>", "====<Space><+><Esc>F=hi", opt) -- Hightligh
map("i", "<C-p>", "![]() <Esc>F[a", opt)
map("i", "<C-a>", "[]() <Esc>F[a", opt)
map("i", "<C-n>", "___<Enter><Enter>", opt)
map("i", "<C-t>", "- [ ] ", opt)
map("i", "<C-j>", "> ", opt) -- Block ctrl

-- 获取时间戳
map("n", "<C-n>", ":r!date '+\\%F \\%H:\\%M'<CR>", opt)

-- DiffView 快捷键
map("n", "<leader>dv", ":DiffviewOpen<CR>", { desc = "DiffView: Open diff" })
map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "DiffView: Close view" })
map("n", "<leader>dh", ":DiffviewFileHistory<CR>", { desc = "DiffView: Branch history" })

---------------------------------插件快捷键----------------------------------
-- local pluginKeys = {}
-- 
-- -- nvim-tree
-- -- alt + m 键打开关闭tree
-- map("n", "<F3>", ":NvimTreeToggle<CR>", opt)
-- -- 列表快捷键
-- pluginKeys.nvimTreeList = {
--   -- 打开文件或文件夹
-- --  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
--   -- 分屏打开文件
--   { key = "v", action = "vsplit" },
--   { key = "h", action = "split" },
--   -- 显示隐藏文件
--   { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
--   { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
--   -- 文件操作
--   { key = "<F5>", action = "refresh" },
--   { key = "a", action = "create" },
--   { key = "d", action = "remove" },
--   { key = "r", action = "rename" },
--   { key = "x", action = "close_node" },
--   { key = "c", action = "copy" },
--   { key = "p", action = "paste" },
--   { key = "s", action = "system_open" },
-- }
-- -- Telescope 列表中 插入模式快捷键
-- pluginKeys.telescopeList = {
--   i = {
--     -- 上下移动
--     ["<C-j>"] = "move_selection_next",
--     ["<C-k>"] = "move_selection_previous",
--     ["<Down>"] = "move_selection_next",
--     ["<Up>"] = "move_selection_previous",
--     -- 历史记录
--     ["<C-n>"] = "cycle_history_next",
--     ["<C-p>"] = "cycle_history_prev",
--     -- 关闭窗口
--     ["<C-c>"] = "close",
--     -- 预览窗口上下滚动
--     ["<C-u>"] = "preview_scrolling_up",
--     ["<C-d>"] = "preview_scrolling_down",
--   },
-- }
-- 
-- -- lsp 回调函数快捷键设置
-- pluginKeys.mapLSP = function(mapbuf)
--   -- rename
--   mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
--   -- code action
--   mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
--   -- go xx
--   mapbuf("n", "C-]", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
--   mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)          --弹窗查看函数的定义提示
--   mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)    --跳转函数声明
--   mapbuf("n", "gm", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt) --跳转到函数实现中
--   mapbuf("n", "gf", "<cmd>lua vim.lsp.buf.references()<CR>", opt)     --列出函数 被引用的地方
--   -- diagnostic
--   mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
--   mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
--   mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
--   mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
--   -- 没用到
--   -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
--   -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
--   -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
--   -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
--   -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
--   -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
-- end
-- 
-- -- nvim-cmp 自动补全
-- pluginKeys.cmp = function(cmp)
--     return {
--         -- 出现补全
--         ["<C-]>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
--         -- 取消
--         ["<A-,>"] = cmp.mapping({
--             i = cmp.mapping.abort(),
--             c = cmp.mapping.close()
--         }),
--         -- 上一个
--         ["<C-k>"] = cmp.mapping.select_prev_item(),
--         -- 下一个
--         ["<C-j>"] = cmp.mapping.select_next_item(),
--         -- 确认
--         ["<CR>"] = cmp.mapping.confirm({
--             select = true,
--             behavior = cmp.ConfirmBehavior.Replace
--         }),
--         -- 如果窗口内容太多，可以滚动
--         ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
--         ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
--     }
-- end
-- 
-- -- gitsigns
-- pluginKeys.gitsigns_on_attach = function(bufnr)
--   local gs = package.loaded.gitsigns
-- 
--   local function map(mode, l, r, opts)
--     opts = opts or {}
--     opts.buffer = bufnr
--     vim.keymap.set(mode, l, r, opts)
--   end
-- 
--   -- Navigation
--   map("n", "<leader>gj", function()
--     if vim.wo.diff then
--       return "]c"
--     end
--     vim.schedule(function()
--       gs.next_hunk()
--     end)
--     return "<Ignore>"
--   end, {
--     expr = true,
--   })
-- 
--   map("n", "<leader>gk", function()
--     if vim.wo.diff then
--       return "[c"
--     end
--     vim.schedule(function()
--       gs.prev_hunk()
--     end)
--     return "<Ignore>"
--   end, {
--     expr = true,
--   })
-- 
-- --  map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
--   map("n", "<leader>gS", gs.stage_buffer)
--   map("n", "<leader>gu", gs.undo_stage_hunk)
--   map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
--   map("n", "<leader>gR", gs.reset_buffer)
--   map("n", "<leader>gp", gs.preview_hunk)
--   map("n", "<leader>gb", function()
--     gs.blame_line({
--       full = true,
--     })
--   end)
--   map("n", "<leader>gd", gs.diffthis)
--   map("n", "<leader>gD", function()
--     gs.diffthis("~")
--   end)
--   -- toggle
--   map("n", "<leader>gtd", gs.toggle_deleted)
--   map("n", "<leader>gtb", gs.toggle_current_line_blame)
--   -- Text object
--   map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
-- end


-- return pluginKeys


