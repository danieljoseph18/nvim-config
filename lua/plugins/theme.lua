return {
  -- 1. Add the Dracula Theme
  {
    "dracula/vim",
    name = "dracula",
    lazy = false,    -- Load immediately during startup
    priority = 1000, -- Load before everything else
    config = function()
      vim.cmd([[colorscheme dracula]])
    end,
  },

  -- 2. Disable the VSCode theme we installed previously
  { "Mofiqul/vscode.nvim", enabled = false },

  -- 3. Disable standard LazyVim themes (optional, saves memory)
  { "tokyonight.nvim", enabled = false },
  { "catppuccin", enabled = false },
}
