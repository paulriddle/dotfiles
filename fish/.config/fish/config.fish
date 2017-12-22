if status --is-interactive
  if [ "$LIGHT_COLORSCHEME" -eq 1 ]
    eval sh $HOME/.config/base16-shell/scripts/base16-gruvbox-light-medium.sh
  else
    eval sh $HOME/.config/base16-shell/scripts/base16-irblack.sh
  end
end

start_agent
set -x GOPATH ~/gocode
