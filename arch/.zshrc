#
# .zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# editor
export VISUAL=nvim
export EDITOR=nvim
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
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# prompt
PS1='%B%F{white}%n%f%F{cyan}@%f%F{white}%m%f%F{cyan}:%f%b%~ %B%F{green}%(!.#.>)%f%b '
PS2="%B%F{cyan}>%f%b "
RPROMPT='%B%(?..%F{red}%?%f)%b %F{white}%T%f'
PROMPT_EOL_MARK=''

# cursor shape as prompt mode indicator
function zle-keymap-select {
  case ${KEYMAP} in
    (vicmd)         echo -ne '\e[2 q';;
    (main|viins)    echo -ne '\e[4 q';;
  esac
}
# initialize cursor shape at shell startup
function zle-line-init {
  zle-keymap-select
}
# bind these functions to ZLE events
zle -N zle-keymap-select
zle -N zle-line-init

# compinstall
zstyle :compinstall filename '/home/remy/.zshrc'
autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit

# zsh plugins
if [ -f '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -f '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-syntax-highlighting.zsh' ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# pacdiff
export DIFFPROG='nvim -d'
export MERGEPROG='git merge-file -p'

# intel
#export LIBVA_DRIVER_NAME='iHD'
#export VDPAU_DRIVER='va_gl'

# nvidia
#export LIBVA_DRIVER_NAME='vdpau'
#export VDPAU_DRIVER='nvidia'

#export GBM_BACKEND=nvidia-drm
#export __GLX_VENDOR_LIBRARY_NAME=nvidia

# vulkan
export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json:/usr/share/vulkan/icd.d/nvidia_icd.json
export MESA_VK_DEVICE_SELECT=10de:1f91
# MESA_VK_DEVICE_SELECT=list vulkaninfo
# Intel UHD: 10de:1f91
# NVIDIA GTX 1650: 8086:3e9b 

# java
JDK='/usr/lib/jvm/java-21-openjdk'
export PATH=$JDK/bin:$PATH
export JAVA_HOME=$JDK
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

# lynx
LYNX_CFG=~/.lynx.cfg
export LYNX_CFG

# colors
export GREP_COLORS="1;33"
export LESS="-R"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#eval $(dircolors -b)
#alias diff='colordiff'

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

