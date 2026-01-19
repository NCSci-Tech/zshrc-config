A customized Zsh configuration featuring enhanced tab completion, syntax highlighting, and auto-suggestions.
Features

Smart tab completion with case-insensitive matching and fuzzy search
Real-time syntax highlighting
Fish-like autosuggestions from command history
Custom two-line prompt
10,000 command history
Auto-cd and extended globbing

Preview
┌──(blvck@host)-[~/projects/my-app]
└─$
Installation
Install Required Packages
Arch/Manjaro:
bashsudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions
Debian/Ubuntu:
bashsudo apt install zsh zsh-syntax-highlighting zsh-autosuggestions
Fedora/RHEL:
bashsudo dnf install zsh zsh-syntax-highlighting zsh-autosuggestions
Setup
bash# Set Zsh as default shell
chsh -s $(which zsh)

# Backup existing config
mv ~/.zshrc ~/.zshrc.backup

# Copy this config
cp .zshrc ~/.zshrc

# Reload
source ~/.zshrc
Plugin Path Configuration
The config expects plugins at /usr/share/zsh/plugins/. If your distro uses different paths:
Find plugin locations:
bashfind /usr -name "zsh-syntax-highlighting.zsh" 2>/dev/null
find /usr -name "zsh-autosuggestions.zsh" 2>/dev/null
Update these lines in .zshrc:
bashsource /YOUR/PATH/TO/zsh-syntax-highlighting.zsh
source /YOUR/PATH/TO/zsh-autosuggestions.zsh
Customization
Change Username in Prompt
Edit the PROMPT variable:
bashPROMPT='%F{blue}┌──(%F{magenta}YOUR_NAME%F{yellow}%F{blue})-[%F{yellow}%~%F{blue}]
%F{blue}└─%F{magenta}$%f '
Adjust History Size
bashHISTSIZE=10000
SAVEHIST=10000
Add Aliases
bashalias ll='ls -lah'
alias gs='git status'
Troubleshooting
Plugins not loading?
Find and update plugin paths in .zshrc:
bashfind /usr -name "zsh-syntax-highlighting.zsh" 2>/dev/null
Completion not working?
bashrm -f ~/.zcompdump*
exec zsh
Can't change shell?
bashecho $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)
Key Bindings
Default Emacs-style bindings:

Ctrl+A - Beginning of line
Ctrl+E - End of line
Ctrl+R - Search history

For Vi-style, change bindkey -e to bindkey -v in .zshrc
