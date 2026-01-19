A beautifully customized Zsh configuration featuring enhanced tab completion, syntax highlighting, and auto-suggestions for a superior terminal experience.

Features

Smart Tab Completion - Case-insensitive matching, fuzzy completion, and intelligent correction
Syntax Highlighting - Real-time command syntax highlighting as you type
Auto-suggestions - Fish-like autosuggestions from command history
Custom Prompt - Beautiful two-line prompt with username and current directory
Extended History - Stores 10,000 commands in ~/.zsh_history
Quality of Life - Auto-cd into directories, extended globbing patterns


Preview
┌──(blvck@host)-[~/projects/my-app]
└─$

Installation
Prerequisites
Install the required packages for your distribution:
Arch/Manjaro/EndeavourOS
bashsudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions
Debian/Ubuntu/Linux Mint/Pop!_OS
bashsudo apt update
sudo apt install zsh zsh-syntax-highlighting zsh-autosuggestions
Fedora/RHEL/CentOS
bashsudo dnf install zsh zsh-syntax-highlighting zsh-autosuggestions
Setup Steps
1. Set Zsh as your default shell
bashchsh -s $(which zsh)

Note: You may need to log out and back in for this to take effect.

2. Backup your existing configuration
bash[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup
3. Copy the configuration
bash# Download or clone this repository, then:
cp .zshrc ~/.zshrc
4. Verify plugin paths
The config expects plugins at standard locations. Find them with:
bashfind /usr -name "zsh-syntax-highlighting.zsh" 2>/dev/null
find /usr -name "zsh-autosuggestions.zsh" 2>/dev/null
Common plugin locations:
DistributionSyntax HighlightingAutosuggestionsArch/Manjaro/usr/share/zsh/plugins/zsh-syntax-highlighting//usr/share/zsh/plugins/zsh-autosuggestions/Debian/Ubuntu/usr/share/zsh-syntax-highlighting//usr/share/zsh-autosuggestions/Fedora/RHEL/usr/share/zsh-syntax-highlighting//usr/share/zsh-autosuggestions/
5. Update plugin paths if needed
Edit the plugin source lines in .zshrc to match your system:
bashsource /YOUR/PATH/TO/zsh-syntax-highlighting.zsh
source /YOUR/PATH/TO/zsh-autosuggestions.zsh
6. Reload configuration
bashsource ~/.zshrc
Or open a new terminal window.

Customization
Change the Prompt
Edit the PROMPT variable in .zshrc. Current format:
┌──(blvck@host)-[/current/directory]
└─$
To change the username, replace blvckbxrd in the PROMPT line:
bashPROMPT='%F{blue}┌──(%F{magenta}YOUR_USERNAME%F{yellow}%F{blue})-[%F{yellow}%~%F{blue}]
%F{blue}└─%F{magenta}$%f '
Adjust History Size
Modify these lines in .zshrc:
bashHISTSIZE=10000      # Commands kept in memory
SAVEHIST=10000      # Commands saved to file
Add More Aliases
Add below the existing update alias:
bashalias ll='ls -lah'
alias gs='git status'
alias ..='cd ..'
alias ...='cd ../..'
Change Key Bindings
Current config uses Emacs-style bindings (bindkey -e). For Vi-style:
bashbindkey -v

Troubleshooting
Plugins not working

Verify installation:

bash   ls /usr/share/zsh/plugins/ 2>/dev/null || ls /usr/share/ | grep zsh

Find correct paths:

bash   find /usr -name "zsh-syntax-highlighting.zsh" 2>/dev/null
   find /usr -name "zsh-autosuggestions.zsh" 2>/dev/null

Update paths in .zshrc to match the output from step 2
Check for errors:

bash   zsh -xv 2>&1 | grep -i "error\|warning"
Completion not working
bash# Delete completion cache
rm -f ~/.zcompdump*

# Reload
exec zsh
Prompt looks broken

Ensure your terminal supports Unicode and 256 colors
Try different terminal emulators: Alacritty, Kitty, GNOME Terminal, Konsole, Terminator

Permission denied when changing shell
bash# Check if zsh is in allowed shells
cat /etc/shells | grep zsh

# If not listed, add it (requires root)
echo $(which zsh) | sudo tee -a /etc/shells

# Then try changing shell again
chsh -s $(which zsh)
Plugins installed but not loading
Some distros require sourcing from different subdirectories. Try these alternative source commands:
bash# For Debian/Ubuntu/Fedora
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

Key Bindings
The configuration uses Emacs-style key bindings by default:
ShortcutActionCtrl+ABeginning of lineCtrl+EEnd of lineCtrl+RSearch historyCtrl+UClear lineCtrl+KDelete to end of lineCtrl+WDelete previous word

Notes

The update alias references ~/./.update.sh - ensure this script exists or remove the alias
Auto-cd is enabled: type directory names without cd
Extended globbing patterns available: **/*.txt finds all .txt files recursively
