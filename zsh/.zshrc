# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Custom configurations


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


# Powerlevel10k theme
zinit depth=1 for romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Fast-syntax-highlighting
zinit light zdharma/fast-syntax-highlighting \


# Autosuggestions
zinit atload"!_zsh_autosuggest_start" for zsh-users/zsh-autosuggestions


# Oh My Zsh Setup
zinit svn multisrc"*.zsh" as"null" for OMZ::lib

# Oh My Zsh plugins
zinit snippet OMZP::alias-finder
zinit snippet OMZP::command-not-found
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::git
zinit snippet OMZP::gitignore
zinit snippet OMZP::lol
zinit snippet OMZP::otp
zinit snippet OMZP::rand-quote
zinit snippet OMZP::safe-paste
zinit snippet OMZP::sudo
zinit snippet OMZP::systemd


# Zinit packages
# zpm-zsh/dircolors-material Zinit package
zinit pack for dircolors-material

# junegunn/fzf Zinit package
zinit pack"bgn-binary+keys" for fzf


# Completions
# Loading this last so that zinit captures all compdef functions
zinit blockf for zsh-users/zsh-completions

zicompinit
zicdreplay

# Custom completions
# zinit atload"!source <(bw completion --shell zsh);compdef _bw bw" for zdharma/null
source <(bw completion --shell zsh); compdef _bw bw
