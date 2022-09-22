# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

# End of lines configured by zsh-newuser-install
# hp() {
#         export https_proxy=http://127.0.0.1:7890
#         export http_proxy=http://127.0.0.1:7890
#         export all_proxy=http://127.0.0.1:7890
#         echo "https_proxy"=$https_proxy
#         echo "http_proxy"=$http_proxy
#         echo "all_proxy"=$all_proxy
# }
#Define `unsetproxy` command to disable proxy configuration
# np() {
#         unset https_proxy
#         unset http_proxy
#         unset all_proxy
#         echo "https_proxy"
#         echo "http_proxy"
#         echo "all_proxy"
# }
# By default, enable proxy configuration for terminal login
#setproxy
#alias code='code --proxy-server="socks5://127.0.0.1:7891"'
#unsetopt beep

#alias sh='sort -t ";" -k 2 -u ~/.zsh_history | sort -o ~/.zsh_history
#    echo "clear"'

alias mu='sudo reflector --country HK --age 6 --latest 3 --fastest 3 --threads 6 --sort rate --protocol http,https --save /etc/pacman.d/mirrorlist'

alias cleanup_packages='(set -x; sudo pacman -Rsn $(pacman -Qdttq))'

alias pping='prettyping --nolegend'

alias preview="fzf --preview 'bat --color \"always\" {}'"
#dd support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

alias doasedit='doas vim'

# lg() {
#     export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

#     lazygit "$@"

#     if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
#             cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
#             rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
#     fi
# }

alias lg='lazygit'

alias pacmansy='doas pacman -Sy'
alias pacmansu='doas pacman -Su'
#alias sudoeg='sudo -E gg'
#export EDITOR=/usr/bin/vim
# source /usr/share/zsh/share/antigen.zsh

# Functions
# ex() {
#     if [[ -f $1 ]]; then
#         case $1 in
#             *.tar.bz2) tar xvjf $1;;
#             *.tar.gz) tar xvzf $1;;
#             *.tar.xz) tar xvJf $1;;
#             *.tar.lzma) tar --lzma xvf $1;;
#             *.bz2) bunzip $1;;
#             *.rar) unrar $1;;
#             *.gz) gunzip $1;;
#             *.tar) tar xvf $1;;
#             *.tbz2) tar xvjf $1;;
#             *.tgz) tar xvzf $1;;
#             *.zip) unzip $1;;
#             *.Z) uncompress $1;;
#             *.7z) 7z x $1;;
#             *.dmg) hdiutul mount $1;; # mount OS X disk images
#             *) echo "'$1' cannot be extracted via >ex<";;
#   esac
#     else
#         echo "'$1' is not a valid file"
#     fi
# }


fanspeed() {
	n='bat /sys/devices/platform/asus-nb-wmi/fan_boost_mode'
	echo n
}


# Created by `pipx` on 2022-09-12 13:57:30
export PATH="$PATH:/home/fh/.local/bin"

autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"
