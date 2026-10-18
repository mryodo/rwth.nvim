-- Lualine theme for rwth.nvim. Follows the active (light/dark) palette.
-- Usage: require("lualine").setup({ options = { theme = "rwth" } })

local rwth = require("rwth")
local p = rwth.get_palette()

local b = { fg = p.fg, bg = rwth.blend(p.rwthblau75, p.bg, 0.3) }
local c = { fg = p.fg, bg = p.bg }
local y = { fg = p.rwthblau75, bg = c.bg }

local function mode(a_bg, z_bg, a_fg)
  return {
    a = { fg = a_fg or p.rwthblau10, bg = a_bg, gui = "bold" },
    b = b,
    c = c,
    y = y,
    z = { fg = p.rwthblau10, bg = z_bg },
  }
end

return {
  normal = mode(p.rwthblau100, p.rwthblau75),
  insert = mode(p.rwthblau75, p.rwthblau100),
  visual = mode(p.rwthblau50, p.rwthblau75, p.mybg),
  replace = mode(p.rwthmagenta75, p.rwthblau100),
  command = mode(p.rwthpetrol75, p.rwthblau100),
  terminal = mode(p.rwthtuerkis100, p.rwthblau100),
  inactive = {
    a = { fg = p.dim, bg = c.bg, gui = "bold" },
    b = { fg = p.dim, bg = c.bg },
    c = { fg = p.dim, bg = c.bg },
  },
}
