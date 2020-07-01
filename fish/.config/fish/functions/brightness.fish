# Defined in - @ line 1
function brightness --description 'Set brightness'
  sudo tee /sys/class/backlight/intel_backlight/brightness;
end
