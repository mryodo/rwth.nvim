local M = {}

M._version = "0.1.0" -- x-release-please-version

---@type rwth.Config
M.defaults = {
  transparent = false,
  theme = {
    dark = "dark",
    light = "light",
  },
  mini_hooks = {
    files = true,
    pick = true,
  },
  styles = {
    functions = { bold = true },
    keywords = {},
    comments = {},
    strings = {},
    constants = {},
  },
  colors = {},
  auto = true,
  cache = true,

  on_highlights = function(highlights, colors) end,
}

---@type rwth.Config
M.options = vim.deepcopy(M.defaults) -- using this we can omit calling setup()

---@param opts rwth.Config|nil
---@return rwth.Config
function M.extend(opts)
  return vim.tbl_deep_extend("force", M.defaults, opts or {})
end

---@param opts rwth.Config|nil
function M.setup(opts)
  M.options = M.extend(opts)
end

return M
