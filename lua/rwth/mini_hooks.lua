local M = {}

function M.central_pick()
  local ok, plugin = pcall(require, "mini.pick")

  if not (ok) then return end

  require("mini.pick").setup()

  local pick = require('mini.pick')

  pick.setup({
    options = {
      content_from_bottom = false,
      use_cache = true,
    },
    window = {
      config = function()
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        return {
          anchor = 'NW',
          height = height,
          width = width,
          row = math.floor(0.5 * (vim.o.lines - height)),
          col = math.floor(0.5 * (vim.o.columns - width)),
          border = 'solid',
        }
      end,
      prompt_prefix = '> ',
      prompt_caret = '▏',
    },
  })

  local hl = function(name, opts) vim.api.nvim_set_hl(0, name, opts) end
  hl('MiniPickMatchCurrent', { link = 'CursorLine' })
  hl('MiniPickMatchMarked', { link = 'Visual' })
  hl('MiniPickMatchRanges', { fg = '#00549f', bold = true })
  hl('MiniPickPreviewLine', { link = 'CursorLine' })
  hl('MiniPickPreviewRegion', { link = 'IncSearch' })
  hl('MiniPickHeader', { link = 'DiagnosticInfo' })

  local mini_pick_diag_map = {
    DiagnosticError            = "MiniPickDiagnosticError",
    DiagnosticWarn             = "MiniPickDiagnosticWarn",
    DiagnosticInfo             = "MiniPickDiagnosticInfo",
    DiagnosticHint             = "MiniPickDiagnosticHint",
    DiagnosticFloatingError    = "MiniPickDiagnosticError",
    DiagnosticFloatingWarn     = "MiniPickDiagnosticWarn",
    DiagnosticFloatingInfo     = "MiniPickDiagnosticInfo",
    DiagnosticFloatingHint     = "MiniPickDiagnosticHint",

    DiagnosticVirtualTextError = "MiniPickDiagnosticError",
    DiagnosticVirtualTextWarn  = "MiniPickDiagnosticWarn",
    DiagnosticVirtualTextInfo  = "MiniPickDiagnosticInfo",
    DiagnosticVirtualTextHint  = "MiniPickDiagnosticHint",
  }

  local function merge_winhighlight(win, extra)
    local current = vim.api.nvim_get_option_value("winhighlight", { win = win })
    local map = {}

    for _, item in ipairs(vim.split(current, ",", { plain = true, trimempty = true })) do
      local from, to = item:match("^([^:]+):(.+)$")
      if from and to then
        map[from] = to
      end
    end

    for from, to in pairs(extra) do
      map[from] = to
    end

    local out = {}
    for from, to in pairs(map) do
      table.insert(out, from .. ":" .. to)
    end
    table.sort(out)

    vim.api.nvim_set_option_value("winhighlight", table.concat(out, ","), { win = win })
  end

  local aug = vim.api.nvim_create_augroup("MiniPickDiagnosticColors", { clear = true })

  local function apply_to_minipick_windows()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_is_valid(win) then
        local buf = vim.api.nvim_win_get_buf(win)

        if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype == "minipick" then
          merge_winhighlight(win, mini_pick_diag_map)
        end
      end
    end
  end

  local function apply_to_minipick_windows_later()
    vim.schedule(apply_to_minipick_windows)
    vim.defer_fn(apply_to_minipick_windows, 10)
    vim.defer_fn(apply_to_minipick_windows, 50)
  end

  vim.api.nvim_create_autocmd("FileType", {
    group = aug,
    pattern = "minipick",
    callback = apply_to_minipick_windows_later,
  })

  vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    group = aug,
    callback = function(args)
      if vim.api.nvim_buf_is_valid(args.buf)
          and vim.bo[args.buf].filetype == "minipick" then
        apply_to_minipick_windows_later()
      end
    end,
  })
end

function M.central_files()
  local ok, plugin = pcall(require, "mini.files")

  if not (ok) then return end

  require('mini.files').setup({
    windows = {
      preview = true,
      width_focus = math.floor(0.6 * vim.o.columns),
      width_nofocus = math.floor(0.36 * vim.o.columns),
      width_preview = math.floor(0.36 * vim.o.columns),
    },
    options = {
      use_as_default_explorer = true,
    },
    content = {
      prefix = function(fs_entry)
        local MiniIcons = require("mini.icons")

        local category = fs_entry.fs_type == "directory" and "directory" or "file"
        local icon, hl, is_default = MiniIcons.get(category, fs_entry.name)

        if is_default then
          hl = "MiniFilesIconDefault"
        end

        return " " .. icon .. " ", hl
      end,
    },
  })

  local minifiles_windows = {}

  local function minifiles_winhl(focused)
    local normal = focused and "MiniFilesNormal" or "MiniFilesNormalInactive"
    local cursorline = focused and "MiniFilesCursorLine" or "MiniFilesCursorLineInactive"
    local title = focused and "MiniFilesTitleFocused" or "MiniFilesTitle"
    local files = focused and "MiniFilesFile" or "MiniFilesFileInactive"
    local dirs = focused and "MiniFilesDirectory" or "MiniFilesFileDirectoryInactive"
    local border = focused and "MiniFilesBorder" or "MiniFilesBorderInactive"

    return table.concat({
      "Normal:" .. normal,
      "NormalFloat:" .. normal,
      "EndOfBuffer:" .. normal,
      "CursorLine:" .. cursorline,
      "MiniFilesBorder:" .. border,
      "FloatBorder:" .. border,
      "FloatTitle:" .. title,
      "MiniFilesFile:" .. files,
      "MiniFilesDirectory:" .. dirs,
    }, ",")
  end

  local function update_minifiles_backgrounds()
    local current_win = vim.api.nvim_get_current_win()

    for win_id in pairs(minifiles_windows) do
      if vim.api.nvim_win_is_valid(win_id) then
        local focused = win_id == current_win

        vim.api.nvim_set_option_value("winhighlight", minifiles_winhl(focused), {
          win = win_id,
        })
      else
        minifiles_windows[win_id] = nil
      end
    end
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesWindowOpen",
    callback = function(args)
      local win_id = args.data.win_id
      minifiles_windows[win_id] = true

      vim.schedule(update_minifiles_backgrounds)
    end,
  })

  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    callback = function()
      vim.schedule(update_minifiles_backgrounds)
    end,
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesWindowOpen',
    callback = function(args)
      local win_id = args.data.win_id
      local config = vim.api.nvim_win_get_config(win_id)

      config.border = 'solid'
      config.title_pos = 'center'
      config.anchor = 'SW'         -- South-West: row/col is the bottom-left corner
      config.row = vim.o.lines - 2 -- 2 lines from the bottom (above cmdline)
      config.col = math.floor(0.2 * (vim.o.columns - config.width))

      vim.wo[win_id].winblend = 0
      vim.api.nvim_win_set_config(win_id, config)
    end,
  })


  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesWindowOpen',
    callback = function(args)
      local win_id = args.data.win_id
      local config = vim.api.nvim_win_get_config(win_id)
      local buf_id = vim.api.nvim_win_get_buf(win_id)
      local info = vim.api.nvim_buf_get_name(buf_id)
      if info and info ~= '' and not vim.fn.isdirectory(info) then
        vim.wo[win_id].winhl = 'Normal:MiniFilesPreviewNormal'
      end
    end,
  })

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesWindowUpdate',
    callback = function(args)
      local config = vim.api.nvim_win_get_config(args.data.win_id)
      config.height = math.min(15, math.floor(vim.o.lines * 0.4))
      config.anchor = 'SW'
      config.row = vim.o.lines - 2
      vim.api.nvim_win_set_config(args.data.win_id, config)
    end,
  })
end
