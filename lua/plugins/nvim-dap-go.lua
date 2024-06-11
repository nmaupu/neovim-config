return {
  {
    "leoluz/nvim-dap-go",
    opts = {},
    config = function()
      require("dap-go").setup {
        dap_configurations = {
          {
            type = "go",
            request = "launch",
            name = "Debug - nuki-logger server",
            program = "main.go",
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {
              "-c",
              "config.yaml",
              "server",
              "-i",
              "60m",
              "-s",
              "telegram",
            },
          },
          {
            type = "go",
            request = "launch",
            name = "Debug - nuki-logger query",
            program = "main.go",
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {
              "-c",
              "config.yaml",
              "query",
              "-l",
              "10",
              "-s",
              "console",
            },
          },
        },
      }
    end,
    event = "VeryLazy", -- Start plugin when nvim starts
  },
}
