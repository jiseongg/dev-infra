return {

  { "folke/lazy.nvim", version = false },
  { "LazyVim/LazyVim", version = false },
  { "folke/trouble.nvim", version = false },
  { "folke/todo-comments.nvim", version = false, opts = {} },

  {
    "neovim/nvim-lspconfig",
    require("lspconfig").protols.setup({}),
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    version = false,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = { ".git" },
        },
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },

    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
