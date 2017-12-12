function toggle_light_colorscheme
  test "$LIGHT_COLORSCHEME" = 1; and set -U LIGHT_COLORSCHEME 0; or set -U LIGHT_COLORSCHEME 1
end
