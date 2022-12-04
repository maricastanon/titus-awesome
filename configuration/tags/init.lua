local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')
local apps = require('configuration.apps')

local tags = {

  {
    icon = icons.chrome,
    type = 'chrome',
    defaultApp = apps.default.browser,
    screen = 1
  },
  {
    icon = icons.code,
    type = 'code',
    defaultApp = apps.default.terminal,
    screen = 1
  },
  {
    icon = icons.coding,
    type = 'coding',
    defaultApp = apps.default.github,
    screen = 1
  },
  {
    icon = icons.folder,
    type = 'files',
    defaultApp = apps.default.files,
    screen = 1
  },
  {
    icon = icons.planing,
    type = 'calendar',
    defaultApp = apps.default.organisation,
    screen = 1
  },
  {
    icon = icons.study,
    type = 'study',
    defaultApp = apps.default.unifiles,
    screen = 1
  },

  {
    icon = icons.writer,
    type = 'writer',
    defaultApp = apps.default.editor,
    screen = 1
  },
  {
    icon = icons.video,
    type = 'youtube',
    defaultApp = apps.default.video,
    screen = 1
  },
  {
    icon = icons.notes,
    type = 'notes',
    defaultApp = apps.default.notes,
    screen = 1
  },
  {
    icon = icons.lab,
    type = 'science',
    defaultApp = apps.default.rofi,
    screen = 1
  },
  {
    icon = icons.social,
    type = 'social',
    defaultApp = apps.default.chat,
    screen = 1
  },
  {
    icon = icons.zoom,
    type = 'zoom',
    defaultApp = apps.default.videochat,
    screen = 1
  },

  {
    icon = icons.music,
    type = 'music',
    defaultApp = apps.default.music,
    screen = 1
  }
}

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.max,
  awful.layout.suit.floating
}

awful.screen.connect_for_each_screen(
  function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(
        i,
        {
          icon = tag.icon,
          icon_only = true,
          layout = awful.layout.suit.tile,
          gap_single_client = false,
          gap = 4,
          screen = s,
          defaultApp = tag.defaultApp,
          selected = i == 1
        }
      )
    end
  end
)

_G.tag.connect_signal(
  'property::layout',
  function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = 4
    end
  end
)
