eval sh $HOME/.config/base16-shell/base16-default.dark.sh
status --is-interactive; and . (rbenv init - | psub)
start_agent

set -x GOPATH ~/gocode
# set -x RUBY_GC_MALLOC_LIMIT 1000000000; set -x RUBY_FREE_MIN 500000; set -x RUBY_HEAP_MIN_SLOTS 40000
