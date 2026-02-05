return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    lazy = false, -- Force load immediately to prevent "Not a command" errors
    dependencies = { 
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      require("telescope").setup({
        defaults = {
          -- Make it look like VS Code (cleaner UI)
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
        },
      })
      -- Load the project extension we added earlier
      pcall(require("telescope").load_extension, "projects")
    end,
  },
}
