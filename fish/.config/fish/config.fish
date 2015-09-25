# Base16 color scheme
eval sh $HOME/.config/base16-shell/base16-atelierheath.light.sh

# Initialize rbenv
source (rbenv init - | psub)

# Run keychain
eval (keychain --eval -Q --quiet galkin-20150916)
