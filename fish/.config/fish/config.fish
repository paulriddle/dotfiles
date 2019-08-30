if status --is-interactive
  source (rbenv init -|psub)
end

start_agent
set -x FISH_CONFIG ~/.config/fish/config.fish
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_CTRL_T_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS '--height 30%'
set -x MYVIMRC ~/.config/nvim/init.vim
set -x NVIM_LISTEN_ADDRESS /tmp/nvimsocket
set -x EDITOR nvim
set -x DOCKER_TLD localhost
set -x _JAVA_AWT_WM_NONREPARENTING 1
