# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle :compinstall filename '/home/username/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Prompt style
VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT='%F{blue}┌──(%F{magenta}username%F{yellow}%F{blue})-[%F{yellow}%~%F{blue}]
%F{blue}└─%F{magenta}$%f '

# Show venv name on right side when activate
precmd() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        RPROMPT="%F{cyan}($(basename $VIRTUAL_ENV))%f"
    else
        RPROMPT=""
    fi
}

# Set SHELL to match running SHELL
export SHELL=/usr/bin/zsh

# Plugins 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias update='~/./.update.sh'
alias l='ls -CF'
