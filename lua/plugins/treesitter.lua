-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "awk",
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "csv",
      "dhall",
      "diff",
      "dockerfile",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "godot_resource",
      "gomod",
      "gosum",
      "gowork",
      "gpg",
      "hcl",
      "html",
      "http",
      "ini",
      "java",
      "javascript",
      "jq",
      "json",
      "json5",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "promql",
      "puppet",
      "pymanifest",
      "python",
      "regex",
      "rego",
      "requirements",
      "sql",
      "ssh_config",
      "strace",
      "terraform",
      "toml",
      "tsv",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    })
  end,
}
