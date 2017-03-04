if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-gruvbox-light-medium.sh
end
status --is-interactive; and . (rbenv init - | psub)
start_agent

set -x GOPATH ~/gocode
