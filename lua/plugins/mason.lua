
return {

{
  "williamboman/mason.nvim",
  dependencies = {"neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim"},
  version = "*",
  config = function()
    require("mason").setup {
      ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
      }

    }

    require("mason-lspconfig").setup({
      ensure_installed = {
      	"lua_ls",
        "bashls",
        "clangd",
        "cmake",
        "pyright",
      },
    })

    local lspconfig = require('lspconfig')
    require("mason-lspconfig").setup_handlers({
      function (server_name)
        require("lspconfig")[server_name].setup{}
      end,
      -- Next, you can provide targeted overrides for specific servers.
      ["lua_ls"] = function ()
        lspconfig.lua_ls.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              }
            }
        }
      }
      end,
      ["clangd"] = function ()
        lspconfig.clangd.setup {
          cmd = {
            "clangd",
            "--background-index",          -- 保留后台索引（按需关闭）
            "--compile-commands-dir=build", -- 明确指定编译数据库目录
            "--completion-style=detailed",  -- 简化补全信息
            "--header-insertion=never",
            "--query-driver=/usr/bin/g++",  -- 明确指定编译器路径
            "--all-scopes-completion",     -- 限制补全作用域
            "--limit-results=50",          -- 限制返回结果数量
            "--malloc-trim",              -- 释放闲置内存
            "--pch-storage=disk",         -- 预编译头存储到磁盘
            "--pretty",                   -- 简化输出格式
            "--log=error"                 -- 仅显示错误日志
          },
          init_options = {
            clangdFileStatus = true,      -- 关闭实时诊断（按需）
            usePlaceholders = false,      -- 禁用占位符标记
          },
          capabilities = {
            textDocument = {
              completion = {
                editsNearCursor = true,  -- 减少自动补全的侵入性
              }
            }
          },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        }
      end
    })

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>ed', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>qd', vim.diagnostic.setloclist)
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gi', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'C-]', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gm', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-ki>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<C-ki>', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<C-ki>', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<C-ki>', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<C-ki>', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<C-ki>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<C-ki>', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gf', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })


    vim.diagnostic.config({
      virtual_text = false,
      signs = false,
      update_in_insert = false,
      underline = false,
      show_header = false,
      severity_sort = false,
      float = {
        source = "always",
        border = "rounded",
        style = "minimal",
        header = "",
        -- prefix = " ",
        -- max_width = 100,
        -- width = 60,
        -- height = 20,
      },
    })

    -- 解决Lsp语法高亮和Treesitter语法高亮冲突的问题
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        client.server_capabilities.semanticTokensProvider = nil
      end
    })

  end
}

}


