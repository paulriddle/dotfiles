start_agent

if status --is-interactive
  set PATH $HOME/.local/bin $HOME/.rbenv/bin $HOME/.cargo/bin $PATH

  source (rbenv init - | psub)

  set -x FZF_DEFAULT_COMMAND 'rg --files --ignore-case'
  set -x FZF_CTRL_T_COMMAND 'rg --files --ignore-case'
  set -x FZF_DEFAULT_OPTS '--height 30%'

  set -x NVIM_LISTEN_ADDRESS /tmp/nvimsocket

  set -x EDITOR nvim
  set -x NNN_USE_EDITOR 1

  set -x DOCKER_TLD localhost
end
