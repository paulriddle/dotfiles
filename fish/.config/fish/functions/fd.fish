# Defined in - @ line 1
function fd --wraps=fd-find --wraps=fdfind --description 'alias fd fdfind'
  fdfind  $argv;
end
