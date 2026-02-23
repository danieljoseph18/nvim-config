-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Ensure cargo binaries (tree-sitter-cli) are found before Mason's fallback.
-- Prevents LazyVim downloading a pre-built tree-sitter binary via Mason,
-- which requires GLIBC 2.39 (unavailable on Ubuntu 22.04 / GLIBC 2.35).
vim.env.PATH = vim.env.HOME .. "/.cargo/bin:" .. vim.env.PATH
