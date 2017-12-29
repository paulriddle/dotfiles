if status --is-interactive
  source (rbenv init -|psub)

  if [ "$LIGHT_COLORSCHEME" -eq 1 ]
    eval sh $HOME/.config/base16-shell/scripts/base16-solarized-light.sh
  else
    eval sh $HOME/.config/base16-shell/scripts/base16-railscasts.sh
  end
end

start_agent
set -x GOPATH ~/gocode
