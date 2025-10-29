
return {

{
  "lewis6991/gitsigns.nvim",
  version = "1.0.2",
  config = function()
      require("gitsigns").setup {
        -- 字母图标 A 增加，C修改，D 删除
        signs = {
          add          = { text = "+", },
          change       = { text = "~", },
          delete       = { text = "_", },
          topdelete    = { text = "‾", },
          changedelete = { text = "*", },
        },

        -- 显示图标
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        -- 行数高亮
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        --keymaps = require("keybindings").gitsigns,
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        -- current_line_blame_formatter_opts = {
        --   relative_time = false,
        -- },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        -- yadm = {
        --   enable = false,
        -- },
        --on_attach = require("keybindings").gitsigns_on_attach,
        on_attach = function(bufnr)
          local function map(mode, lhs, rhs, opts)
              opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
              vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
          end
          map('n', ']g', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
          map('n', '[g', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})


        end
      }
  end
}

}

