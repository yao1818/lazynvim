
return {

{
  "hrsh7th/nvim-cmp",
  version = "*",
  dependencies = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/vim-vsnip"},
  config = function()
      local cmp = require("cmp")
      require("cmp").setup {
        snippet = {
          expand = function(args)
            -- For `vsnip` users.
            vim.fn["vsnip#anonymous"](args.body)
            -- For `luasnip` users.
            -- require('luasnip').lsp_expand(args.body)
            -- For `ultisnips` users.
            -- vim.fn["UltiSnips#Anon"](args.body)
            -- For `snippy` users.
            -- require'snippy'.expand_snippet(args.body)
          end,
        },

        -- 快捷键设置
        --mapping = require("keybindings").cmp(cmp),
        mapping = cmp.mapping.preset.insert({
          -- 出现补全
          ["<C-]>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
          -- 取消
          ["<A-,>"] = cmp.mapping({
              i = cmp.mapping.abort(),
              c = cmp.mapping.close()
          }),
          -- 上一个
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          -- 下一个
          ["<C-j>"] = cmp.mapping.select_next_item(),
          -- 确认
          ["<CR>"] = cmp.mapping.confirm({
              select = true,
              behavior = cmp.ConfirmBehavior.Replace
          }),
          -- 如果窗口内容太多，可以滚动
          ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
          ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),

          --["<C-n>"] = cmp.mapping(function(fallback)
          --  if cmp.visible() then
          --    cmp.select_next_item()
          --  elseif vim.fn["vsnip#available"](1) == 1 then
          --    feedkey("<Plug>(vsnip-expand-or-jump)", "")
          --  elseif has_words_before() then
          --    cmp.complete()
          --  else
          --    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          --  end
          --end, { "i", "s" }),

          --["<C-[>"] = cmp.mapping(function()
          --  if cmp.visible() then
          --    cmp.select_prev_item()
          --  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          --    feedkey("<Plug>(vsnip-jump-prev)", "")
          --  end
          --end, { "i", "s" }),
        }),
        -- 补全源
        sources = cmp.config.sources(
        {
          { name = "nvim_lsp" },
          -- For vsnip users. 该插件可以在选择候选时候将括号内容选入
          { name = "vsnip" },

          -- For luasnip users.
          -- { name = 'luasnip' },

          --For ultisnips users.
          -- { name = 'ultisnips' },

          -- -- For snippy users.
          -- { name = 'snippy' },
        },
        {
          { name = "buffer" },
          { name = "path" },
        }),



    }

    -- / 查找模式使用 buffer 源
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
    
    -- : 命令行模式中使用 path 和 cmdline 源.
    --cmp.setup.cmdline(":", {
    --  mapping = cmp.mapping.preset.cmdline(),
    --  sources = cmp.config.sources(
    --  {
    --    { name = "path" },
    --  }, {
    --    { name = "cmdline" },
    --  }),
    --})
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })


  end
}

}

