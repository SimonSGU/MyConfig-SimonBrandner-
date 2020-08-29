# Prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Prompt

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
# History

# Auto-complete
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# Auto-complete

# Aliases
alias ls="ls --color=auto"
alias l="ls -lah --color=auto"
alias la="ls -ah --color=auto"
alias ll="ls -lh --color=auto"
alias aptup="sudo aptitude update && sudo aptitude full-upgrade"
alias sizeof="du -sh"
alias x11vncUnencrypted="x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/simon/.vnc/passwd -rfbport 5900 -shared"
alias x11vncEncrypted="x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/simon/.vnc/passwd -rfbport 5900 -shared -ssl"
# Aliases

# Setup
tabs 4
neofetch
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# Setup

# Path
export PATH=/home/simon/.local/lib/python3.7/site-packages/:$PATH
export PATH=PATH:$PATH
export PATH=/usr/local/bin/:$PATH
export PATH=/snap/bin:$PATH
export PATH=/usr/games:$PATH
export PATH=/usr/local/games:$PATH
export PATH=/home/simon/GIT/Frameworks/flutter/bin:$PATH
# Path

# Locale
export LANG=en_US.utf8
export LANGUAGE=en_US.utf8
export LC_CTYPE=cs_CZ.utf8
export LC_NUMERIC=cs_CZ.utf8
export LC_COLLATE=cs_CZ.utf8
export LC_MONETARY=cs_CZ.utf8
export LC_MESSAGES=cs_CZ.utf8
export LC_PAPER=cs_CZ.utf8
export LC_NAME=cs_CZ.utf8
export LC_ADDRESS=cs_CZ.utf8
export LC_TELEPHONE=cs_CZ.utf8
export LC_MEASUREMENT=cs_CZ.utf8
export LC_IDENTIFICATION=cs_CZ.utf8
export LC_TIME=en_ISO.utf8
# Locale

# Plugins
source ~/GIT/Other/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-antigen/antigen.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Plugins

# Keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# Keybindings
