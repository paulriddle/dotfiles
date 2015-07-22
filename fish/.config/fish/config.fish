# Base16 color scheme
eval sh $HOME/.config/base16-shell/base16-atelierheath.light.sh

# Initialize rbenv
source (rbenv init - | psub)

# Temporary workaround for nvm
set -x NVM_NODEJS_ORG_MIRROR https://nodejs.org/dist
