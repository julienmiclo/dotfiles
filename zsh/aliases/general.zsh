alias ..="cd .."
alias ld="ls"
alias ll="ls -lah --color=auto --group-directories-first"
alias l="ls -CF"
alias c="clear"

alias fonts="fc-list | cut -d ' ' -f2 | sort -u"

alias poweroff="sudo systemctl poweroff"
alias reboot="sudo systemctl reboot"

alias wifi="sudo wifi-menu"
alias load-keyboard="~/.dotfiles/scripts/.scripts/keyboard/load_apple_keyboard.sh"
alias unload-keyboard="~/.dotfiles/scripts/.scripts/keyboard/unload_apple_keyboard.sh"

alias load-aukey="~/.dotfiles/scripts/.scripts/aukey.sh"

alias clear-cache="trizen -Sc --noconfirm"

alias ssh="TERM=xterm-256color ssh"
alias homeserver="ssh root@82.226.104.119"
