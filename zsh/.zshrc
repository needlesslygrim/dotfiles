# P10K instant prompt
if [ "$TERM" != "linux" ]; then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi

if [ "$TERM" = "linux" ]; then
  PROMPT='%n@%m %~ $# '
fi

# Setup completion
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/needlesslygrim/.zshrc'

autoload -Uz compinit
compinit

autoload -U bashcompinit
bashcompinit

# History options
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt hist_ignore_all_dups
unsetopt beep
unsetopt correct
bindkey -e

# Source required zsh scripts
source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"
if [ "$TERM" != "linux" ]; then
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Setup thefuck
eval $(thefuck --alias)

# Add required binaries to path
export PATH="$PATH:/home/needlesslygrim/.cargo/bin"

#eval "$(register-python-argcomplete pipx)"
#eval "$(_MPM_COMPLETE=zsh_source mpm)"

# export XDG_DATA_HOME=$HOME/.local/share
# export XDG_CONFIG_HOME=$HOME/.config
# export XDG_STATE_HOME=$HOME/.local/state
# export XDG_CACHE_HOME=$HOME/.cache


# npm set prefix ~/.npm
# export PATH="$HOME/.npm/bin:$PATH"
# export PATH="$HOME/node_modules/.bin:$PATH"
# export PATH="$PATH:/home/needlesslygrim/.local/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.



# Aliases
alias cc=clang
alias pandoc="pandoc --pdf-engine=xelatex -V mainfont='Berkeley Mono'"
# alias ls="lsd --colour=always --git-ignore --git"
# alias tree="lsd --tree --colour=always"
unalias lsd
unalias ls

alias today="date -u +%Y.%m.%d"

export GPG_TTY=$(tty)

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

export PATH="$PATH:$HOME/Github/osxcross/target/bin"

# opam configuration
[[ ! -r /home/needlesslygrim/.opam/opam-init/init.zsh ]] || source /home/needlesslygrim/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
