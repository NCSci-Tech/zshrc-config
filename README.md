A minimal Zsh configuration, this setup includes smart tab completion, history management, syntax highlighting, autosuggestions, and a custom prompt.

***Features***

 - Advanced Tab Completion
 - Powered by compinit and zstyle, this configuration enables:
 - Case-insensitive completion
 - Approximate matching (typos are forgiven)
 - Expanded and corrected completions
 - Improved matching for characters such as ., _, and -
 - Command History
 - Stores up to 10,000 commands
 - Persistent history across sessions
 - History file location:
 - ~/.zsh_history
 - Shell Behavior Tweaks
 - autocd – change directories by typing their name
 - extendedglob – advanced globbing support
 - nomatch – prevents errors on unmatched globs
 - notify – background job notifications
 - Terminal bell disabled
 - Keybindings
 - Uses Emacs-style keybindings by default:
    - bindkey -e

***Prompt***

Example:
```bash
┌──(username)-[~/projects]
└─$
```

Colors are handled using Zsh’s built-in %F{} formatting.

***Plugins***

This configuration uses the following plugins:

 - zsh-syntax-highlighting
 - Highlights commands as you type to help catch errors early

 - zsh-autosuggestions
 - Provides command suggestions based on history

Plugins are sourced from:
/usr/share/zsh/plugins/

Ensure these plugins are installed via your system package manager.

***Aliases***

Included alias:
 - alias update='~/.update.sh'
 - alias l='ls -CF --color=auto'
 - alias ls='ls --color=auto'
 - alias grep='grep --color=auto'

*Requirements*

 - Zsh
 - zsh-syntax-highlighting
 - zsh-autosuggestions
