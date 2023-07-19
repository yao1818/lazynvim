
return {

{
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
      require("telescope").setup {

        defaults = {
          -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
          initial_mode = "insert",
          -- 窗口内快捷键
--          mappings = require("keybindings").telescopeList,
        },
        extensions = {
           -- 扩展插件配置
        },

      }
  end
}

}


