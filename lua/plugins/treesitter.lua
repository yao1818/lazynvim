local G = require('G')

return {

{
  "nvim-treesitter/nvim-treesitter",
  dependencies = {"nvim-treesitter/playground", after = 'nvim-treesitter'},
  version = "*",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { "c", "cpp", "bash", "lua", "vim", "vimdoc", "markdown", "go",},
    
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
    
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,
    
      -- List of parsers to ignore installing (for "all")
      -- ignore_install = { "javascript" },
    
      ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
      -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
    
      highlight = {
        enable = true,
    
        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 800 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      G.hi({
        ["@function"] = { fg = "#B8BB50", bold = true};
        ["@function.call"] = { fg = "#B8BB50", bold = true};
        ["@storageclass"] = { fg = "#83A598", bold = false};
        ["@constant"] = { fg = "#83A598", bold = false};
        ["@type"] = { fg = "#83A598", bold = false};
        ["@type.builtin"] = { fg = "#83A598", bold = false};
        ["@string"] = { fg = "#83A598", bold = false};
        ["@keyword"] = { fg = "#83A598", bold = false};
        ["@repeat"] = { fg = "#fabd2f", bold = false};
        --["@keyword.return"] = { fg = "#fabd2f", bold = false};
        ["@conditional"] = { fg = "#fabd2f", bold = false};
        ["@punctuation.bracket"] = { fg = "#d5c4a1", bold = false};
        ["@punctuation.delimiter"] = { fg = "#d5c4a1", bold = false};  -- 6AB97C green DEB34D
        ["@number"] = { fg = "#fabd2f", bold = false};
        ["@variable"] = { fg = "#d5c4a1", bold = false};
        ["@parameter"] = { fg = "#d5c4a1", bold = false};
        ["@property"] = { fg = "#d5c4a1", bold = false};
        ["@operator"] = { fg = "#bfc4a1", bold = false};

      }),

      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
--          toggle_query_editor = 'o',
--          toggle_hl_groups = 'i',
--          toggle_injected_languages = 't',
--          toggle_anonymous_nodes = 'a',
--          toggle_language_display = 'I',
--          focus_language = 'f',
--          unfocus_language = 'F',
--          update = 'R',
--          goto_node = '<cr>',
--          show_help = '?',
        },
      }

    }
  end
}

}
