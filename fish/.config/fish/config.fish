if status --is-interactive
  source (rbenv init -|psub)
  eval sh $HOME/.config/base16-shell/scripts/base16-one-light.sh
  # eval sh $HOME/.config/base16-shell/scripts/base16-gruvbox-dark-hard.sh
end

start_agent
set -x GOPATH ~/gocode
