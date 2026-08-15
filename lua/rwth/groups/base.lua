local Utils = require("rwth.utils")


local M = {}

--- Get base highlight groups, see `:h highlight-groups`
---@type rwth.HighlightsFn
function M.get_hl(c, opts)
  -- stylua: ignore
  return {
    MsgArea          = { bg = "none", fg = c.fg },
    Normal           = { fg = c.fg, bg = opts.transparent and "none" or c.bg },
    NormalFloat      = { link = "Normal" },
    FloatBorder      = { fg = c.border, bg = opts.transparent and "none" or c.bg, },
    Cursor           = { fg = c.fg, bg = c.fg },
    TermCursor       = { link = "Cursor" },
    lCursor          = { link = "Cursor" },
    CursorIM         = { link = "Cursor" },
    CursorColumn     = { bg = c.line, fg = c.fg, },
    CursorLine       = { bg = c.line, fg = c.fg, },
    ColorColumn      = { bg = c.line, fg = c.fg, },
    CursorLineNr     = { fg = c.special, bold = true, },
    LineNr           = { fg = c.statusline },
    StatusLine       = { fg = c.fg, bg = "none" },
    StatusLineNC     = { fg = c.comment, bg = opts.transparent and "none" or c.line },
    StatusLineTerm   = { link = "StatusLine" },
    StatusLineTermNC = { link = "StatusLineNC" },
    WinBar           = { link = "Normal" },
    WinBarNC         = { link = "Normal" },
    WinSeparator     = { bg = c.border },
    Pmenu            = { bg = c.fg, fg = c.bg },
    PmenuSel         = { fg = c.fg, bg = c.line, bold = true },
    PmenuBorder      = { fg = c.fg, bg = c.fg },
    PmenuThumb       = { bg = c.fg },
    PmenuMatch       = { fg = c.match, bold = true },
    Visual           = { bg = c.line },
    Search           = { link = "Visual" },
    CurSearch        = { link = "DiffChange" },
    IncSearch        = { link = "CurSearch" },
    Substitute       = { link = "DiffAdd" },
    MatchParen       = { fg = c.special, bold = true },
    NonText          = { fg = c.dim },
    EndOfBuffer      = { fg = c.line },
    Question         = { fg = c.const },
    MoreMsg          = { link = "Question" },
    ErrorMsg         = { fg = c.danger },
    WarningMsg       = { link = "Question" },
    ModeMsg          = { link = "Question" },
    MsgSeparator     = { fg = c.fg },
    Directory        = { fg = c.emphasis },
    QuickFixLine     = { fg = c.const, underline = true },
    qfLineNr         = { fg = c.comment },
    SpecialKey       = { fg = c.comment },
    TabLineSel       = { fg = c.emphasis, bg = c.line },
    Title            = { fg = c.emphasis, bold = true },
    DiffAdd          = { fg = c.success, bg = Utils.blend(c.success, c.bg, 0.2) },
    DiffChange       = { fg = c.warning, bg = Utils.blend(c.warning, c.bg, 0.2) },
    DiffDelete       = { fg = c.danger, bg = Utils.blend(c.danger, c.bg, 0.2) },
    DiffText         = { fg = c.warning, bg = Utils.blend(c.warning, c.bg, 0.4) },
  }
end

return M
