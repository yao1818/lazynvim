return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require('gruvbox').setup({
        undercurl = true,
        underline = false,
        bold = true,
        italic =  {
           strings = false,
           operators = false,
           comments = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        dim_inactive = false,
        palette_overrides = {},
        transparent_mode = false,
        overrides = {
        SignColumn   = {bg = ""},
        Search       = {fg = "#928374"}, -- 搜索的背景颜色
        IncSearch    = {fg = "#d79921"}, -- 光标指向搜索文字时颜色
        CursorLine   = {bg = "#282828"},

        --MatchParen    = {fg = "#b16286"},  --光标在括号上显示的颜色
        }

      })
      vim.cmd([[colorscheme gruvbox]])

    end,



  },

}
