return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = .9,
        height = 1,
      }
    },
    config = function(_, opts)
      require'zen-mode'.setup(opts)
    end,
  },
}
