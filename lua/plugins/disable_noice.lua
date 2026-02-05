return {
  -- Disable the floating command line and message UI
  { "folke/noice.nvim", enabled = false },
  
  -- Restore the standard message area height so you can see commands
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = true },
      -- Ensure standard UI elements aren't suppressed
    },
  },
}
