if status --is-interactive
  source (rbenv init -|psub)
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
end

start_agent
set -x FISH_CONFIG ~/.config/fish/config.fish
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_CTRL_T_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS '--height 30%'
set -x MYVIMRC ~/.config/nvim/init.vim
set -x NVIM_LISTEN_ADDRESS /tmp/nvimsocket
set -x XKB_DEFAULT_LAYOUT us,ru
set -x XKB_DEFAULT_OPTIONS grp:alt_shift_toggle,caps:ctrl_modifier
set -x EDITOR nvim
set -x DOCKER_TLD localhost
