return {
  -- 1. Project Manager (Force load immediately)
  {
    "ahmedkhalf/project.nvim",
    lazy = false, 
    config = function()
      require("project_nvim").setup({
        -- This ensures it finds .git folders correctly
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      })
      -- Connect to Telescope
      require("telescope").load_extension("projects")
    end,
  },
  
  -- 2. Dashboard Config (Snacks)
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          keys = {
            -- We use standard Telescope commands that are guaranteed to exist
            { icon = " ", key = "p", desc = "Projects", action = ":Telescope projects" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
            { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
