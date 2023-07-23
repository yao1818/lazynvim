
return {

{
  "lukas-reineke/indent-blankline.nvim",
  version = "*",
  config = function()
      require("indent_blankline").setup {
        -- 空行占位
        space_char_blankline = " ",
        -- 用 treesitter 判断上下文
        show_current_context = false,
        show_current_context_start = false,
        context_patterns = {
          "class",
          "function",
          "method",
          "element",
          "^if",
          "^while",
          "^for",
          "^object",
          "^table",
          "block",
          "arguments",
        },
        -- :echo &filetype
        filetype_exclude = {
          "dashboard",
          "packer",
          "terminal",
          "help",
          "log",
          "markdown",
          "TelescopePrompt",
          "lsp-installer",
          "lspinfo",
          "toggleterm",
        },
        -- 竖线样式
        --  char = '¦'
        -- char = '┆'
         char = '│'
        -- char = "⎸",
        --char = "▏",
      }
  end
}

}
