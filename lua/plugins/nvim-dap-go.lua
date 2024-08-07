return {
  {
    "leoluz/nvim-dap-go",
    commit = "36abe1d320cb61bfdf094d4e0fe815ef58f2302a",
    opts = {},
    config = function()
      require("dap-go").setup {
        dap_configurations = {
          {
            type = "go",
            request = "launch",
            name = "nuki-logger server",
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
            name = "ovh-hiera-render - genfiles",
            program = "main.go",
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {
              "--log-format=plain",
              "--verbosity=debug",
              "hiera",
              "genfiles",
              "-c",
              "/home/nmaupu/work/tmp/hiera/puppetlabs/puppet/hiera.yaml",
              "-s",
              "::cluster_name=9002.dev",
              "-s",
              "::environment=preprod_stein",
              "-s",
              "::ovh_org=DEV",
              "-s",
              "::infra_type=dev",
              "-o",
              "/tmp/test",
            },
          },
          {
            type = "go",
            request = "launch",
            name = "ovh-hiera-render - lookup",
            program = "main.go",
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {
              "--log-format=json",
              "--verbosity=debug",
              "hiera",
              "lookup",
              "-c",
              "/home/nmaupu/work/tmp/hiera/puppetlabs/puppet/hiera.yaml",
              "rabbit_ips",
              "::environment=preprod_stein",
              "::cluster_name=9002.dev",
              "::ovh_org=DEV",
              "::infra_type=dev",
            },
          },
        },
      }
    end,
    event = "VeryLazy", -- Start plugin when nvim starts
  },
}
