return {
  -- 1. TERMINAL (Toggleterm)
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    keys = {
      { "<C-j>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<C-`>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    },
    opts = {
      size = 15,
      open_mapping = [[<C-j>]],
      direction = "horizontal",
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
    },
  },

  -- 2. FILE TREE (Neo-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- Force specific behavior to prevent duplicate windows
    cmd = "Neotree",
    keys = {
      { 
        "<C-b>", 
        function() 
          require("neo-tree.command").execute({ toggle = true, position = "left", dir = vim.loop.cwd() }) 
        end, 
        desc = "Explorer NeoTree (Toggle)", 
      },
    },
    opts = {
      -- Prevent it from opening in a split or hijacking the netrw window incorrectly
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true, -- Auto-update when files change outside nvim
        filtered_items = {
          visible = true, 
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        window = {
          mappings = {
            ["<C-b>"] = "close_window", -- Allow closing with Ctrl+B while inside the tree
          },
        },
      },
      window = {
        position = "left",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
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
