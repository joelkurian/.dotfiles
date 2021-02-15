# Skip the not really helping global compinit
skip_global_compinit=1

typeset -U PATH path

# Allow global package installations for the current user
path=("$HOME/.node_modules/bin" "$path[@]")
export npm_config_prefix=~/.node_modules

# Setting GOPATH
export GOPATH=$HOME/go
path=("$GOPATH/bin" "$path[@]")

# Ruby Gems
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
path=("$path[@]" "$GEM_HOME/bin")

# Set PATH
path=("$HOME/.local/bin" "$path[@]")
export PATH

# Emacsclient
#export ALTERNATE_EDITOR=""
#export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
#export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode

export VAGRANT_DEFAULT_PROVIDER="libvirt"

export TERMINAL="alacritty"
