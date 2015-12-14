if status --is-interactive
  eval sh $HOME/.config/base16-shell/base16-atelierheath.light.sh
end

status --is-interactive; and . (rbenv init - | psub)
start_agent

set -x GOPATH ~/gocode
# set -x RUBY_GC_MALLOC_LIMIT 1000000000; set -x RUBY_FREE_MIN 500000; set -x RUBY_HEAP_MIN_SLOTS 40000
