local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Roboto medium 20'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.teal
theme.primary.hue_500 = '#009688'
-- Accent
theme.accent = mat_colors.purple

-- Background
theme.background = mat_colors.pink

theme.background.hue_800 = '#63142f'
theme.background.hue_900 = '#e85687'

local awesome_overrides = function(theme)
  --
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
