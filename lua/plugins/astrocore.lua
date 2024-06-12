-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        mouse = "", -- sets vim.opt.mouse and disable it
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        ["<C-t>"] = { ":TestNearest<cr>", desc = "Test nearest function" },
        ["<leader>dt"] = {
          function() require("dap-go").debug_test() end,
          desc = "Run test in debug mode",
        },
        ["<leader>lt"] = { ":GoTests<cr>", desc = "Generate code to unit test this function" },
        ["<leader>lT"] = { ":GoTestsAll<cr>", desc = "Generate code to unit test all functions" },

        -- custom mappings
        ["<C-Up>"] = { ":wincmd k<cr>", desc = "Navigate to the pane up" },
        ["<C-Down>"] = { ":wincmd j<cr>", desc = "Navigate to the pane down" },
        ["<C-Left>"] = { ":wincmd h<cr>", desc = "Navigate to the pane left" },
        ["<C-Right>"] = { ":wincmd l<cr>", desc = "Navigate to the pane right" },
        ["<C-S-Up>"] = { ":horizontal res -5<cr>", desc = "Decrease pane size vertically" },
        ["<C-S-Down>"] = { ":horizontal res +5<cr>", desc = "Increase pane size vertically" },
        ["<C-S-Left>"] = { ":vertical res -5<cr>", desc = "Decrease pane size horizontally" },
        ["<C-S-Right>"] = { ":vertical res +5<cr>", desc = "Increase pane size horizontally" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      i = {},
      v = {},
    },
  },
}
