if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-google-light.sh
end
status --is-interactive; and source (rbenv init - | psub)
start_agent

set -x GOPATH ~/gocode
