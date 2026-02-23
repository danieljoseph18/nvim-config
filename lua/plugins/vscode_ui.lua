return {
  -- 0. DISABLE SNACKS EXPLORER (belt-and-suspenders; lazyvim.json selects neo-tree)
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
  },

  -- 1. TERMINAL (Toggleterm) — multi-terminal support
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-j>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<C-`>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<C-\\>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Vertical Terminal" },
      { "<C-1>", "<cmd>1ToggleTerm<cr>", desc = "Terminal 1" },
      { "<C-2>", "<cmd>2ToggleTerm<cr>", desc = "Terminal 2" },
      { "<C-3>", "<cmd>3ToggleTerm<cr>", desc = "Terminal 3" },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      open_mapping = [[<C-j>]],
      direction = "horizontal",
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      winbar = {
        enabled = true,
        name_formatter = function(term)
          return "Terminal " .. term.id
        end,
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Terminal-mode keymaps for window navigation and escape
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*toggleterm#*",
        callback = function()
          local buf_opts = { buffer = 0, silent = true }
          vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], buf_opts)
          vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], buf_opts)
          vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], buf_opts)
          vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], buf_opts)
        end,
      })
    end,
  },

  -- 2. FILE TREE (Neo-tree) — LazyVim neo-tree extra provides init, deactivate, config,
  --    all <leader> keymaps, window mappings, and default_component_configs.
  --    We only add our custom opts here (merged by lazy.nvim).
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<C-b>",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "left", dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (Toggle)",
      },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
      window = {
        width = 30,
        mappings = {
          ["<C-b>"] = "close_window",
        },
      },
    },
  },

  -- 3. TABS (Bufferline)
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "buffers",
        show_buffer_close_icons = true,
        show_close_icon = true,
        always_show_bufferline = true,
        separator_style = "slant",
      },
    },
  },
}
