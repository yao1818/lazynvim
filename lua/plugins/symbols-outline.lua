
return {

{
  "simrat39/symbols-outline.nvim",
  version = "*",
  config = function()
      require("symbols-outline").setup {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = 'right',
        relative_width = true,
        width = 18,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = 'Pmenu',
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { '▶', '▽' },--{ '▶', '▽' },
        wrap = false,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = {"<Esc>", "q"},
--          goto_location = "<Cr>",
--          focus_location = "o",
--          hover_symbol = "<C-q>",  --显示函数细节
          toggle_preview = "<C-i>",
--          rename_symbol = "r",
--          code_actions = "a",
--          fold = "h",
--          unfold = "l",
          fold_all = "<c-i>w",
          unfold_all = "<c-i>e",
--          fold_reset = "R",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
          File = { icon = "", hl = "TSURI" },
          Module = { icon = "▪", hl = "TSNamespace" },
          Namespace = { icon = "", hl = "TSNamespace" },
          Package = { icon = "", hl = "TSNamespace" },
          Class = { icon = "𝓒", hl = "TSType" },
          Method = { icon = "ƒ", hl = "TSMethod" },
          Property = { icon = "", hl = "TSMethod" },
          Field = { icon = "", hl = "TSField" },
          Constructor = { icon = "", hl = "TSConstructor" },
          Enum = { icon = "ℰ", hl = "TSType" },
          Interface = { icon = "ﰮ", hl = "TSType" },
          Function = { icon = "ƒ", hl = "TSFunction" }, --◦
          Variable = { icon = "𝓐", hl = "TSConstant" },
          Constant = { icon = "𝓐", hl = "TSConstant" },
          String = { icon = "𝓐", hl = "TSString" },
          Number = { icon = "#", hl = "TSNumber" },
          Boolean = { icon = "𝓐", hl = "TSBoolean" },
          Array = { icon = "𝓐", hl = "TSConstant" },
          Object = { icon = "𝓐", hl = "TSType" },
          Key = { icon = "𝓐", hl = "TSType" },
          Null = { icon = "NULL", hl = "TSType" },
          EnumMember = { icon = "", hl = "TSField" },
          Struct = { icon = "𝓢", hl = "TSType" },
          Event = { icon = "🗲", hl = "TSType" },
          Operator = { icon = "+", hl = "TSOperator" },
          TypeParameter = { icon = "𝙏", hl = "TSParameter" },
--          File = { icon = "", hl = "@text.uri" },
--          Module = { icon = "▷", hl = "@namespace" },
--          Namespace = { icon = "▷", hl = "@namespace" },
--          Package = { icon = "▷", hl = "@namespace" },
--          Class = { icon = "▷", hl = "@type" },
--          Method = { icon = "▷", hl = "@method" },
--          Property = { icon = "▷", hl = "@method" },
--          Field = { icon = "▷", hl = "@field" },
--          Constructor = { icon = "▷", hl = "@constructor" },
--          Enum = { icon = "▷", hl = "@type" },
--          Interface = { icon = "▷", hl = "@type" },
--          Function = { icon = "▷", hl = "@function" },
--          Variable = { icon = "▷", hl = "@constant" },
--          Constant = { icon = "▷", hl = "@constant" },
--          String = { icon = "▷", hl = "@string" },
--          Number = { icon = "▷", hl = "@number" },
--          Boolean = { icon = "▷", hl = "@boolean" },
--          Array = { icon = "▷", hl = "@constant" },
--          Object = { icon = "▷", hl = "@type" },
--          Key = { icon = "▷", hl = "@type" },
--          Null = { icon = "▷", hl = "@type" },
--          EnumMember = { icon = "▷", hl = "@field" },
--          Struct = { icon = "", hl = "@type" },
--          Event = { icon = "▷", hl = "@type" },
--          Operator = { icon = "+", hl = "@operator" },
--          TypeParameter = { icon = "▷", hl = "@parameter" },
--          Component = { icon = "▷", hl = "@function" },
--          Fragment = { icon = "▷", hl = "@constant" },
        },

      }
  end
}

}


