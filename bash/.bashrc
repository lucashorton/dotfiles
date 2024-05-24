#!/bin/bash

# Path

export PATH=$HOME/.local/bin:$PATH

# SSH Agent

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

# History

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export HISTCONTROL=ignoreboth
export HISTSIZE=1000

# run-help

run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m vi-insert -x '"\eh": run-help'
bind -m emacs -x     '"\eh": run-help'

# Functions

function gogh() {
  bash -c "$(wget -qO- https://git.io/vQgMr)"
}

function greeting(){
  HOST=$(hostnamectl hostname)
  printf '\033[0;32m'
  figlet "$HOST"
  inxi
}

function update() {
  paru 
  flatpak update
}

# Aliases

alias docker='podman'
alias history='fc -l 1'
alias u='update'
alias w='weather'
alias weather='curl wttr.in'
alias vi="nvim"
alias vim="nvim"
alias mutt="neomutt"
alias orphan="paru -Qtdq | paru -Rns -"

# Command not found
source /usr/share/doc/find-the-command/ftc.bash

# Auto cd

shopt -s autocd

# Prompt

greeting
eval "$(starship init bash)"  

# blesh

[[ $- == *i* ]] && source /usr/share/blesh/ble.sh

#ASDF

. $HOME/.asdf/asdf.sh
#. "$HOME/.cargo/env"
