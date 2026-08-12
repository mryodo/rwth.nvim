local M = {}

---@type rwth.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {
    BlinkCmpLabelMatch = { fg = c.highlight },
  }
end

return M
