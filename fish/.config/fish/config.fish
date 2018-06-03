if status --is-interactive
  source (rbenv init -|psub)
  eval sh $HOME/.config/base16-shell/scripts/base16-classic-dark.sh
end

start_agent

set -x FISH_CONFIG ~/.config/fish/config.fish
set -x I3 ~/.config/i3/config
set -x FZF_DEFAULT_COMMAND 'rg --files --ignore-case'
set -x FZF_CTRL_T_COMMAND 'rg --files --ignore-case'
set -x FZF_DEFAULT_OPTS '--height 30%'
set -x MYVIMRC ~/.config/nvim/init.vim
set -x NVIM_LISTEN_ADDRESS /tmp/nvimsocket
set -x XKB_DEFAULT_LAYOUT us,ru
set -x XKB_DEFAULT_OPTIONS grp:alt_shift_toggle,caps:ctrl_modifier
