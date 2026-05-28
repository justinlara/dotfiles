-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  { "Pocco81/auto-save.nvim" },

  { 'nvim-treesitter/nvim-treesitter', lazy = false,  branch = 'main', build = ':TSUpdate' },



  -- {
  --   "nvim-telescope/telescope.nvim",
  --   branch = "master",
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  --   },
  -- },

  --{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  { 'nvim-tree/nvim-web-devicons', opts = {} },

  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- {
  --   'nvim-neo-tree/neo-tree.nvim',
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   lazy = false,
  -- },

  { 'neovim/nvim-lspconfig' },

  {'akinsho/toggleterm.nvim', version = "*", config = true },

  {'tpope/vim-fugitive' },

  { 'vim-test/vim-test' },

})
