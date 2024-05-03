return {
  {
    "klen/nvim-test",
    event = "User AstroFile",
    config = function()
      require('nvim-test').setup({
        run = true,
        commands_create = true,
        term = "terminal",
        termOpts = {
          direction = "vertical",
          width = 96,
          height = 24,
          go_back = false,
          stopinsert = "auto",
          keep_one = true,
        },
        runners = {
          go = "nvim-test.runners.go-test",
        }
      })
    end,
  },
}
