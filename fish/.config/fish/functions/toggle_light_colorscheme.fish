function toggle_light_colorscheme
  [ "$LIGHT_COLORSCHEME" -eq 1 ]; set -U LIGHT_COLORSCHEME $status;
  echo $LIGHT_COLORSCHEME
end
