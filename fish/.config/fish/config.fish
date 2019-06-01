if status --is-interactive
  source (rbenv init -|psub)
end

start_agent

set -x FZF_DEFAULT_COMMAND 'rg --files --ignore-case'
set -x FZF_CTRL_T_COMMAND 'rg --files --ignore-case'
set -x FZF_DEFAULT_OPTS '--height 30%'
set -x NVIM_LISTEN_ADDRESS /tmp/nvimsocket
set -x XKB_DEFAULT_LAYOUT us,ru
set -x XKB_DEFAULT_OPTIONS grp:alt_shift_toggle,caps:ctrl_modifier
set -x EDITOR nvim
set -x NNN_USE_EDITOR 1
set -x DOCKER_TLD localhost
