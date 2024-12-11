local function get_go_module_prefix()
  local go_mod_path = vim.fn.findfile("go.mod", ".;")
  if go_mod_path == "" then
    return nil
  end

  local file = io.open(go_mod_path, "r")
  if not file then
    return nil
  end

  for line in file:lines() do
    local module_name = line:match("^module%s+(.+)")
    if module_name then
      file:close()
      return module_name
    end
  end

  file:close()
  return nil
end

return {
  { "fatih/vim-go", version = false },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local module_prefix = get_go_module_prefix() or ""
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.goimports.with({
          args = { "-local", module_prefix },
        }),
      })
    end,
  },
}
