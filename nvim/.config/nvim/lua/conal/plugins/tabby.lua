return {
  'nanozuki/tabby.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local palette = require("catppuccin.palettes").get_palette("mocha")

    -- Catppuccin-styled theme
    local theme = {
      fill = { fg = palette.subtext0, bg = palette.mantle },
      head = { fg = palette.crust, bg = palette.mauve, style = 'bold' },
      current_tab = { fg = palette.crust, bg = palette.lavender, style = 'bold' },
      tab = { fg = palette.subtext0, bg = palette.surface0 },
      win = { fg = palette.text, bg = palette.surface0 },
      tail = { fg = palette.crust, bg = palette.mauve, style = 'bold' },
    }

    local tabby = require("tabby.tabline")
    tabby.set(function(line)
      return {
        {
          { '  ', hl = theme.head },
          line.sep('', theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep('', hl, theme.fill),
            tab.is_current() and '' or '󰆣',
            tab.number(),
            tab.name(),
            tab.close_btn(''),
            line.sep('', hl, theme.fill),
            hl = hl,
            margin = ' ',
          }
        end),
        line.spacer(),
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          return {
            line.sep('', theme.win, theme.fill),
            win.is_current() and '' or '',
            win.buf_name(),
            line.sep('', theme.win, theme.fill),
            hl = theme.win,
            margin = ' ',
          }
        end),
        {
          line.sep('', theme.tail, theme.fill),
          { '  ', hl = theme.tail },
        },
        hl = theme.fill,
      }
    end)
  end,
}
