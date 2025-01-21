local wezterm = require 'wezterm';

return {
  -- Set the default program
  default_prog = { '/usr/bin/env', 'bash' },

  -- Set the font and font size
  font = wezterm.font("Jetbrains Mono"),
  font_size = 13.0,

  -- Set color scheme
  color_scheme = "OneHalfDark",

  -- Set window transparency
  window_background_opacity = 0.95,

  -- Hide tab bar if there's only one tab
  hide_tab_bar_if_only_one_tab = true,

  -- Window padding
  window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 25,
  },

  -- Use a steady block cursor
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 600,
  animation_fps = 144,

  -- Set scrollback lines to a large number for history
  scrollback_lines = 10000,

  -- Key bindings
  keys = {
    -- CTRL+T to open a new tab
    {key="t", mods="CTRL", action=wezterm.action{SpawnTab="DefaultDomain"}},

    -- CTRL+W to close the current tab
    {key="w", mods="CTRL", action=wezterm.action{CloseCurrentTab={confirm=true}}},

    -- CTRL+ALT+D to split pane horizontally
    {key="d", mods="CTRL|ALT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},

    -- CTRL+SHIFT+D to split pane vertically
    {key="d", mods="CTRL|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},

    -- CTRL+Left/Right Arrow to move between tabs
    {key="LeftArrow", mods="CTRL", action=wezterm.action{ActivateTabRelative=-1}},
    {key="RightArrow", mods="CTRL", action=wezterm.action{ActivateTabRelative=1}},

    -- CTRL+Enter to toggle full screen
    {key="Enter", mods="CTRL", action="ToggleFullScreen"},
  },

  -- Enable native macOS-style key repeat
  enable_csi_u_key_encoding = true,

  -- Set the default window size to something familiar
  initial_cols = 120,
  initial_rows = 30,

  -- Enable Scrollbar
  enable_scroll_bar = true,
}