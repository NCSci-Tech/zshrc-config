Features

Smart Tab Completion: Case-insensitive matching, fuzzy completion, and correction suggestions
Syntax Highlighting: Real-time command syntax highlighting as you type
Auto-suggestions: Fish-like autosuggestions from command history
Custom Prompt: Two-line prompt with username and current directory
Extended History: Stores 10,000 commands in ~/.zsh_history
Quality of Life: Auto-cd into directories, extended globbing patterns

Prerequisites
Required Packages
Install these packages for your distribution:
Arch/Manjaro/EndeavourOS:
bashsudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions
Debian/Ubuntu/Linux Mint/Pop!_OS:
bashsudo apt update
sudo apt install zsh zsh-syntax-highlighting zsh-autosuggestions
Fedora/RHEL/CentOS:
bashsudo dnf install zsh zsh-syntax-highlighting zsh-autosuggestions
openSUSE:
bashsudo zypper install zsh zsh-syntax-highlighting zsh-autosuggestions
Gentoo:
bashsudo emerge app-shells/zsh app-shells/zsh-syntax-highlighting app-shells/zsh-autosuggestions
Alpine Linux:
bashsudo apk add zsh zsh-syntax-highlighting zsh-autosuggestions
Void Linux:
bashsudo xbps-install -S zsh zsh-syntax-highlighting zsh-autosuggestions
NixOS:
Add to your configuration.nix:
nixprograms.zsh = {
  enable = true;
  syntaxHighlighting.enable = true;
  autosuggestions.enable = true;
};
FreeBSD:
bashsudo pkg install zsh zsh-syntax-highlighting zsh-autosuggestions
macOS (Homebrew):
bashbrew install zsh zsh-syntax-highlighting zsh-autosuggestions
Installation

Set Zsh as your default shell:

bash   chsh -s $(which zsh)
Note: You may need to log out and back in for this to take effect.

Backup existing configuration (if any):

bash   [ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup

Copy the configuration:

Place the provided .zshrc file in your home directory (~/.zshrc)


Verify plugin paths:
The config expects plugins at:

/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

If your distribution installs them elsewhere, update the paths in .zshrc.
Common plugin locations by distro:
DistributionSyntax Highlighting PathAutosuggestions PathArch/Manjaro/usr/share/zsh/plugins/zsh-syntax-highlighting//usr/share/zsh/plugins/zsh-autosuggestions/Debian/Ubuntu/usr/share/zsh-syntax-highlighting//usr/share/zsh-autosuggestions/Fedora/RHEL/usr/share/zsh-syntax-highlighting//usr/share/zsh-autosuggestions/openSUSE/usr/share/zsh-syntax-highlighting//usr/share/zsh-autosuggestions/Gentoo/usr/share/zsh/site-functions//usr/share/zsh/site-functions/Alpine/usr/share/zsh/plugins/zsh-syntax-highlighting//usr/share/zsh/plugins/zsh-autosuggestions/macOS (Homebrew)/opt/homebrew/share/zsh-syntax-highlighting//opt/homebrew/share/zsh-autosuggestions/FreeBSD/usr/local/share/zsh-syntax-highlighting//usr/local/share/zsh-autosuggestions/
To find plugin locations on your system:

bash   # Find syntax-highlighting
   find /usr -name "zsh-syntax-highlighting.zsh" 2>/dev/null
   
   # Find autosuggestions
   find /usr -name "zsh-autosuggestions.zsh" 2>/dev/null
   
   # For Homebrew on macOS
   find /opt/homebrew -name "zsh-syntax-highlighting.zsh" 2>/dev/null

Update plugin paths in .zshrc if needed:
Edit these lines to match your system:

bash   source /YOUR/PATH/TO/zsh-syntax-highlighting.zsh
   source /YOUR/PATH/TO/zsh-autosuggestions.zsh

Reload configuration:

bash   source ~/.zshrc
```
   
   Or open a new terminal window.

## Customization

### Change the Prompt

Edit the `PROMPT` variable in `.zshrc`. Current format:
```
┌──(blvck@host)-[/current/directory]
└─$
To change the username, replace blvckbxrd in the PROMPT line:
bashPROMPT='%F{blue}┌──(%F{magenta}YOUR_USERNAME%F{yellow}%F{blue})-[%F{yellow}%~%F{blue}]
%F{blue}└─%F{magenta}$%f '
Adjust History Size
Modify these lines:
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
Plugins not working?

Verify installation:

bash   # Check if plugins are installed
   ls /usr/share/zsh/plugins/ 2>/dev/null || ls /usr/share/ | grep zsh

Find correct paths:

bash   find /usr -name "zsh-syntax-highlighting.zsh" 2>/dev/null
   find /usr -name "zsh-autosuggestions.zsh" 2>/dev/null

Update paths in .zshrc to match the output from step 2
Check for errors:

bash   zsh -xv 2>&1 | grep -i "error\|warning"
Completion not working?
bash# Delete completion cache
rm -f ~/.zcompdump*

# Reload
exec zsh
Prompt looks broken?

Ensure your terminal supports Unicode and 256 colors
Try different terminal emulators:

Linux: Alacritty, Kitty, GNOME Terminal, Konsole, Terminator
macOS: iTerm2, Alacritty, Kitty
Windows (WSL): Windows Terminal, Alacritty



Permission denied when changing shell?
bash# Check if zsh is in allowed shells
cat /etc/shells | grep zsh

# If not listed, add it (requires root)
echo $(which zsh) | sudo tee -a /etc/shells

# Then try changing shell again
chsh -s $(which zsh)
Plugins installed but not loading?
For NixOS users: Don't manually source plugins. Use the system configuration instead.
For manual installations: Some distros require sourcing from different subdirectories:
bash# Try these alternative source commands
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
Notes

The update alias references ~/./.update.sh - ensure this script exists or remove the alias
Emacs keybindings are enabled by default (bindkey -e):

Ctrl+A: Beginning of line
Ctrl+E: End of line
Ctrl+R: Search history


Auto-cd is enabled: type directory names without cd
Extended globbing patterns available: **/*.txt finds all .txt files recursively

Additional Resources

Zsh Documentation
Zsh Wiki
Oh My Zsh - Framework for managing Zsh configuration (alternative approach)
