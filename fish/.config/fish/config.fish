start_agent

set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_CTRL_T_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS '--height 30%'

set -x EDITOR nvim

set -x DOCKER_TLD localhost
set -x FONTCONFIG_PATH /etc/fonts
set -x GPG_TTY (tty)

source ~/.asdf/asdf.fish
