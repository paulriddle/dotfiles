# Defined in - @ line 1
function fehsvg --wraps='feh --conversion-timeout 1 -F' --description 'alias fehsvg feh --conversion-timeout 1 -F'
  feh --conversion-timeout 1 -F $argv;
end
