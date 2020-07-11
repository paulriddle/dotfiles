# Defined in - @ line 1
function sudo --wraps='sudo -v; sudo' --description 'alias sudo sudo -v; sudo'
 command sudo -v; sudo $argv;
end
