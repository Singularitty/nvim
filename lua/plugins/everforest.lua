-- Everforest colorscheme, matching the desktop (Hyprland/eww/kitty/starship).
---@type LazySpec
return {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    main = "everforest",
    opts = {
      background = "medium",
      transparent_background_level = 1, -- kitty's own translucency shows through
      italics = true,
      ui_contrast = "high",
      float_style = "dim",
      diagnostic_text_highlight = true,
      diagnostic_virtual_text = "coloured",
      on_highlights = function(hl, p)
        local dark, surface, sel = "#1b2023", "#232a2e", "#3d484d"
        -- floats & completion: solid so text stays readable over the wallpaper
        hl.NormalFloat = { fg = p.fg, bg = dark }
        hl.FloatBorder = { fg = "#56635f", bg = dark }
        hl.FloatTitle = { fg = p.yellow, bg = dark, bold = true }
        hl.Pmenu = { fg = p.fg, bg = dark }
        hl.PmenuSel = { fg = "#232a2e", bg = p.green, bold = true }
        hl.PmenuSbar = { bg = surface }
        hl.PmenuThumb = { bg = "#56635f" }
        hl.BlinkCmpMenu = { link = "Pmenu" }
        hl.BlinkCmpMenuBorder = { link = "FloatBorder" }
        hl.BlinkCmpMenuSelection = { link = "PmenuSel" }
        hl.BlinkCmpDoc = { link = "NormalFloat" }
        hl.BlinkCmpDocBorder = { link = "FloatBorder" }
        -- current line: subtle, gold line number like the window borders
        hl.CursorLine = { bg = "#1e2427" }
        hl.CursorLineNr = { fg = p.yellow, bold = true }
        hl.Visual = { bg = sel }
        hl.WinSeparator = { fg = "#3d484d" }
        -- dashboard header in Everforest green
        hl.SnacksDashboardHeader = { fg = p.green }
        hl.SnacksDashboardIcon = { fg = p.yellow }
        hl.SnacksDashboardKey = { fg = p.orange }
      end,
    },
  },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = { colorscheme = "everforest" },
  },
}
