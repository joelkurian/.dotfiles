# Skip the not really helping global compinit
skip_global_compinit=1

typeset -U PATH path

# Allow global package installations for the current user
path=("$HOME/.node_modules/bin" "$path[@]")
export npm_config_prefix=~/.node_modules

# Setting GOPATH
path=("$HOME/go/bin" "$path[@]")
export GOPATH=$HOME/go

# Set PATH
path=("$HOME/.local/bin" "$path[@]")
export PATH

