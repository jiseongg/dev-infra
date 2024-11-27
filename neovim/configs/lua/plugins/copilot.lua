return {
  "zbirenbaum/copilot.lua",
  keys = {
    {
      "<leader>cp",
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
}
