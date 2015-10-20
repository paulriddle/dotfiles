eval sh $HOME/.config/base16-shell/base16-chalk.dark.sh
eval (keychain --eval -Q --quiet galkin-20150916)

status --is-interactive; and . (rbenv init -|psub)

# set -x RUBY_GC_MALLOC_LIMIT 1000000000
# set -x RUBY_FREE_MIN 500000
# set -x RUBY_HEAP_MIN_SLOTS 40000
