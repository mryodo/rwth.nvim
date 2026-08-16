local M = {}

---@param opts rwth.Config|nil
function M.setup(opts)
  require("rwth.config").setup(opts)
  if opts.mini_hooks.pick then
    require("rwth.mini_hooks").central_pick()
  end
  if opts.mini_hooks.files then
    require("rwth.mini_hooks").central_files()
  end

  -- Reload the colorscheme with :RWTHFetch
  vim.api.nvim_create_user_command("RWTHFetch", function()
    require("rwth.utils").reload()
  end, {})
end

--- Get the current palette with any user overrides applied
---@return rwth.Palette
function M.get_palette(theme)
  theme = require("rwth.utils").resolve(theme)
  local config = require("rwth.config")
  local palette = require("rwth.palette." .. theme)

  -- Apply custom color overrides if they exist
  if config.options.colors and type(config.options.colors) == "table" then
    palette = vim.tbl_deep_extend("force", palette, config.options.colors)
  end

  return palette
end

--- Blends two colors based on alpha transparency
---@param foreground string Foreground hex color
---@param background string Background hex color
---@param alpha number Blend factor (0 to 1)
---@return string # A hex color string like "#RRGGBB"
function M.blend(foreground, background, alpha)
  return require("rwth.utils").blend(foreground, background, alpha)
end

--- Main function to apply the theme
function M.load(theme)
  local name = theme and "rwth-" .. theme
  theme = require("rwth.utils").resolve(theme)
  local config = require("rwth.config")
  local groups = require("rwth.groups") -- points to lua/rwth/groups/init.lua
  local palette = M.get_palette(theme)

  -- Reset existing highlights to prevent styles from previous themes from bleeding over.
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = name

  -- Unpack and resolve custom styles
  local hl_groups = groups.setup(palette, config.options, theme)

  -- Apply highlights
  for group, hl in pairs(hl_groups) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

return M
