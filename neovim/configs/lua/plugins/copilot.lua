return {
  "zbirenbaum/copilot.lua",
  keys = {
    {
      "<leader>cpe",
      function()
        if require("copilot.client").is_disabled() then
          require("copilot.command").enable()
        else
          require("copilot.command").disable()
        end
      end,
      desc = "Toggle (Copilot)",
    },
  },
  suggestion = {
    keymap = {
      accept = "<C-h>",
      prev = "<C-j>",
      next = "<C-k>",
      dismiss = "<C-l>",
    },
  },
}
