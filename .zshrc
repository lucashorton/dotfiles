# ZSH Config

# Launch sway if on TTY
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec $HOME/.config/sway/sway.sh 
fi

# Variables
EDITOR=/usr/bin/nvim

# History
export HISTFILE=~/.histfile
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY

# Fuzzy search
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# ASDF
. /opt/asdf-vm/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Completion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

# Colors
autoload colors; colors

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Functions
function greeting(){
  NAME=$(figlet $HOST)
  echo $fg[cyan]$NAME
  echo "\n"
  inxi
}

function orphan() {
  yay -Qtdq | yay -Rns -
}

function update() {
  yay 
  flatpak update
  flatpak uninstall --unused
  orphan
}

function weather() {
  curl wttr.in
}

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias history='fc -l 1'
alias u="update"
alias w="weather"

# Print greeting
greeting

# Prompt
eval "$(starship init zsh)"
