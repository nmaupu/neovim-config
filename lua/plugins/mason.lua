-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "ansiblels",
        "awk_ls",
        "bashls",
        "dhall_lsp_server",
        "dockerls",
        "golangci_lint_ls",
        "gopls",
        "helm_ls",
        "jqls",
        "jsonls",
        "terraformls",
        "tflint",
        "vimls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "codespell",
        "commitlint",
        "golangci-lint",
        "jsonlint",
        "markdownlint-cli2",
        "ruff",
        "semgrep",
        "shellcheck",
        "shellharden",
        "staticcheck",
        "stylua",
        "tflint",
        "tfsec",
        "trivy",
        "typos",
        "yamllint",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "bash-debug-adapter",
        "delve",
        "python",
      })
    end,
  },
}
