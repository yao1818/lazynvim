
return {

{
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({

      options = {
        theme = "gruvbox",
        icons_enabled = false,
        component_separators = { left = "|", right = "|" },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = { left = "|", right = "|" },
      },
      extensions = { "nvim-tree", "toggleterm" },
      sections = {
        lualine_b = {
            'branch',
        },
        lualine_c = {
          { 'filename', file_status = false, path = 1 },
          {
            "lsp_progress",
            spinner_symbols = { "", "", "", " ", " ", "" },
          },
        },
        lualine_x = {
          "filesize",
--          {
--            "fileformat",
--            -- symbols = {
--            --   unix = '', -- e712
--            --   dos = '', -- e70f
--            --   mac = '', -- e711
--            -- },
--           symbols = {
--             unix = "LF",
--             dos = "CRLF",
--             mac = "CR",
--           },
--          },
          "encoding",
          --"filetype",
        },
      },

    })
  end
}

}

