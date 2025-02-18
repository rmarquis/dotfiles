#
# ~/.zshrc
#
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
#PS1='%B%F{white}%n%f%F{cyan}@%f%F{white}%m%f%F{cyan}:%f%b%~ %B%F{cyan}%(!.#.>)%f%b '
#PS2="%B%F{cyan}>%f%b "
#RPROMPT='%B%(?..%F{red}%?%f)%b %F{white}%T%f'
#PROMPT_EOL_MARK=''
eval "$(starship init zsh)"

# editor
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export GIT_EDITOR=nvim

# zsh
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
bindkey "^[[3~" delete-char
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

# compinstall
zstyle :compinstall filename '/home/remy/.zshrc'
autoload -Uz compinit
compinit

# autosuggestions
if [ -f '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# colors
export GREP_COLORS="1;33"
export LESS="-R"
eval $(dircolors -b)
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias diff='colordiff'

# colored man pages
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;37m") \
    LESS_TERMCAP_md=$(printf "\e[1;37m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;47;30m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[0;36m") \
    man "$@"
}

# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

