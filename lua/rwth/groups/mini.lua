local M = {}

---@type rwth.HighlightsFn
function M.get_hl(c)
  -- stylua: ignore
  return {

    -- INFO: fixed
    MiniStatuslineModeNormal      = { fg = c.ministnorfg, bg = c.ministnorbg, bold = true },
    MiniStatuslineModeInsert      = { fg = c.ministinsfg, bg = c.ministinsbg, bold = true },
    MiniStatuslineModeVisual      = { fg = c.ministvisfg, bg = c.ministvisbg, bold = true },
    MiniStatuslineModeVisualBlock = { fg = c.ministvisfg, bg = c.ministvisbg, bold = true },
    MiniStatuslineModeCommand     = { fg = c.ministcomfg, bg = c.ministcombg, bold = true },
    MiniStatuslineSepRightDim     = { fg = c.highlight, bg = "none" },
    MiniStatuslineDevinfo         = { fg = c.rwthblau10, bg = c.highlight },

    PillTabline                   = { bg = c.bg },
    PillTablineFill               = { bg = c.bg },
    PillTablineCurrent            = { bg = c.rwthblau100, fg = c.pilltabcurfg },
    PillTablineCurrentSep         = { fg = c.rwthschwarz100, bg = c.mybg },
    PillTablineCurrentMod         = { bg = c.const, fg = c.mybg },
    PillTablineCurrentModSep      = { fg = c.rwthschwarz100, bg = c.bg },
    PillTablineVisible            = { bg = c.operator, fg = c.fg },
    PillTablineVisibleSep         = { fg = c.operator, bg = c.bg },
    PillTablineHidden             = { bg = c.dim, fg = c.bg },
    PillTablineHiddenSep          = { fg = c.rwthschwarz100, bg = c.bg },

    MiniJump2dSpot                = { fg = c.fg, bg = c.line, bold = true },
    MiniIconsGrey                 = { fg = c.dim },
    MiniFilesIconDefault          = { fg = c.rwthtuerkis100 },
    MiniIconsAzure                = { fg = c.rwthtuerkis100 },
    MiniIconsBlue                 = { fg = c.info },
    MiniIconsCyan                 = { fg = c.info },
    MiniIconsGreen                = { fg = c.success },
    MiniIconsOrange               = { fg = c.warning },
    MiniIconsPurple               = { fg = c.pink },
    MiniIconsRed                  = { fg = c.danger },
    MiniIconsYellow               = { fg = c.const },

    MiniNotifyNormal              = { bg = c.info, fg = c.minifilesfg },
    MiniNotifyBorder              = { bg = c.info, fg = c.minifilesbg },
    MiniNotifyTitle               = { bg = c.minifilestitfobg, fg = c.minifilestitfofg, bold = true },
    MiniNotifyLspProgress         = { bg = c.minifilesbg, fg = c.minifilesfg },


    MiniFilesNormal             = { bg = c.minifilesbg, fg = c.minifilesfg },

    MiniFilesNormalInactive     = { bg = c.mybg2 },
    MiniFilesCursorLineInactive = { bg = c.info },
    MiniFilesBorder             = { bg = c.minifilesbg, fg = c.minifilesfg },
    MiniFilesBorderInactive     = { bg = c.minifilesbg, fg = c.mybg },

    MiniFilesDirectory          = { fg = c.minifilesfile },
    MiniFilesDirectoryInactive  = { fg = c.minifilesfilein },
    MiniFilesFile               = { fg = c.minifilesfg },
    MiniFilesFileInactive       = { fg = c.minifilesfilein },
    MiniFilesCursorLine         = { bg = c.bg, fg = c.fg, bold = true },

    --  WARN: I am not sure what this does
    MiniFilesBorderModified     = { bg = c.fg, fg = c.mybg },


    MiniFilesTitle            = { bg = c.minifilestitbg, fg = c.minifilestitfg },
    MiniFilesTitleFocused     = { bg = c.minifilestitfobg, fg = c.minifilestitfofg, bold = true },

    MiniPickNormal            = { bg = c.minifilesbg, fg = c.minifilesfg },
    MiniPickHeader            = { bg = c.minifilesbg, fg = c.minifilesfg },
    MiniPickBorderText        = { bg = c.minifilestitfobg, fg = c.minifilestitfofg },
    MiniPickBorder            = { bg = c.minifilesbg, fg = c.minifilesfg },

    MiniPickPrompt            = { fg = c.ministnorfg, bold = true, bg = c.fg },
    MiniPickPromptCaret       = { bold = true, bg = c.fg },
    MiniPickPromptPrefix      = { fg = c.ministnorfg, bold = true, bg = c.fg },
    MiniPickMatchCurrent      = { bg = c.bg, fg = c.fg },
    MiniPickMatchRanges       = { fg = c.rwthorange100 },

    -- MiniCompletionActiveParameter = { bg = c.const },
    MiniStatuscolumnSepCursor = { fg = c.info },
    MiniStatuscolumnDim       = { fg = c.info },

    BentoNormal               = { bg = c.rwthblau25, fg = c.rwthblau100 },
    MiniPickDiagnosticError   = { fg = c.rwthmagenta100, bold = true },
    MiniPickDiagnosticWarn    = { fg = c.rwthorange100, bold = true },
    MiniPickDiagnosticInfo    = { fg = c.rwthblau100 },
    MiniPickDiagnosticHint    = { fg = c.rwthpetrol100 },
  }
end

return M
