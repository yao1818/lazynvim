
return {

{
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  build = function()
    -- 插件更新后自动开启 jump_labels
    local config_path = vim.fn.stdpath("data") .. "/lazy/flash.nvim/lua/flash/config.lua"
    local content = vim.fn.readfile(config_path)
    local modified = false
    for i, line in ipairs(content) do
      if line:match("^%s*jump_labels%s*=%s*false") then
        content[i] = line:gsub("jump_labels%s*=%s*false", "jump_labels = true")
        modified = true
      end
    end
    if modified then
      vim.fn.writefile(content, config_path)
    end
  end,
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Flash Remote" },
  },
}

}
