if status --is-interactive
  source (rbenv init -|psub)

  if [ "$LIGHT_COLORSCHEME" -eq 1 ]
    eval sh $HOME/.config/base16-shell/scripts/base16-gruvbox-light-medium.sh
  else
    eval sh $HOME/.config/base16-shell/scripts/base16-railscasts.sh
  end
end

start_agent

set -x GOPATH ~/gocode
set -x FISH_CONFIG ~/.config/fish/config.fish
set -x I3 ~/.config/i3/config
set -x FZF_DEFAULT_COMMAND 'rg --files --ignore-case'
set -x FZF_CTRL_T_COMMAND 'rg --files --ignore-case'
set -x FZF_DEFAULT_OPTS '--height 30%'
set -x MYVIMRC ~/.config/nvim/init.vim
