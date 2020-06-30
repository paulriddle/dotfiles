# Defined in - @ line 1
function vifish --wraps='vi ~/.config/fish/config.fish' --description 'alias vifish vi ~/.config/fish/config.fish'
  vi ~/.config/fish/config.fish $argv;
end
