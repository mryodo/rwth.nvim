local M = {}

---@type rwth.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    TelescopeMatching = { fg = c.rwthorange100 },
  }
end

return M
