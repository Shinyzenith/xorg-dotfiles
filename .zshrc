# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|

# Aliases for a few useful commands
alias getclassname='xprop | grep WM_CLASS'
alias searchpkg='sudo pacman -Ss'
alias l='exa -lahF --color=always --icons --sort=size --group-directories-first'
alias ls='exa -lhF --color=always --icons --sort=size --group-directories-first'
alias gshell='gcloud alpha cloud-shell ssh'
#alias lst = 'exa -lahFT --color=always --icons --sort=size --group-directories-first'
alias lst='exa -lahFT --color=always --icons --sort=size --group-directories-first'
alias r='ranger'
alias c='clear'
alias e='exit'
alias m='mocp'
alias g='gotop'
alias vim='nvim'
alias mcserver='ssh 176.9.65.47 -p 2201 -l aakash'
alias botserver='ssh 176.9.65.47 -p 2200 -l bot'

neofetch
SAVEHIST=50000
HISTFILE=~/.zsh_history

# Font mode for powerlevel9k
P9K_MODE="nerdfont-complete"

# Prompt elements
P9K_LEFT_PROMPT_ELEMENTS=(custom_user dir vcs)
P9K_RIGHT_PROMPT_ELEMENTS=(background_jobs go_version virtualenv)

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Prompt settings
P9K_PROMPT_ON_NEWLINE=true
P9K_RPROMPT_ON_NEWLINE=true
P9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON=$'%K{white}%k'
P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON=$'%K{green}%F{black} \uf155 %f%F{green}%k\ue0b0%f '

# Separators
P9K_LEFT_SEGMENT_SEPARATOR_ICON=$'\ue0b0'
P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON=$'\ue0b1'
P9K_RIGHT_SEGMENT_SEPARATOR_ICON=$'\ue0b2'
P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON=$'\ue0b7'

# Dir colours
P9K_DIR_HOME_BACKGROUND='black'
P9K_DIR_HOME_FOREGROUND='white'
P9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
P9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
P9K_DIR_DEFAULT_BACKGROUND='yellow'
P9K_DIR_DEFAULT_FOREGROUND='black'
P9K_DIR_SHORTEN_LENGTH=2
P9K_DIR_SHORTEN_STRATEGY="truncate_from_right"

# OS segment
P9K_OS_ICON_BACKGROUND='black'
P9K_LINUX_ICON='%F{cyan} \uf303 %F{white} arch %F{cyan}linux%f'

# VCS icons
P9K_VCS_GIT_ICON=$'\uf1d2 '
P9K_VCS_GIT_GITHUB_ICON=$'\uf113 '
P9K_VCS_GIT_GITLAB_ICON=$'\uf296 '
P9K_VCS_BRANCH_ICON=$''
P9K_VCS_STAGED_ICON=$'\uf055'
P9K_VCS_UNSTAGED_ICON=$'\uf421'
P9K_VCS_UNTRACKED_ICON=$'\uf00d'
P9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
P9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# VCS colours
P9K_VCS_MODIFIED_BACKGROUND='blue'
P9K_VCS_MODIFIED_FOREGROUND='black'
P9K_VCS_UNTRACKED_BACKGROUND='green'
P9K_VCS_UNTRACKED_FOREGROUND='black'
P9K_VCS_CLEAN_BACKGROUND='green'
P9K_VCS_CLEAN_FOREGROUND='black'

# VCS CONFIG
P9K_VCS_SHOW_CHANGESET=false

# Status
P9K_STATUS_OK_ICON=$'\uf164'
P9K_STATUS_ERROR_ICON=$'\uf165'
P9K_STATUS_ERROR_CR_ICON=$'\uf165'

# Battery
P9K_BATTERY_LOW_FOREGROUND='red'
P9K_BATTERY_CHARGING_FOREGROUND='blue'
P9K_BATTERY_CHARGED_FOREGROUND='green'
P9K_BATTERY_DISCONNECTED_FOREGROUND='blue'
P9K_BATTERY_VERBOSE=true

# Programming languages
P9K_RBENV_PROMPT_ALWAYS_SHOW=true
P9K_GO_VERSION_PROMPT_ALWAYS_SHOW=true
P9K_VIRTUALENV_FOREGROUND='white'
P9K_VIRTUALENV_BACKGROUND='darkblue'

# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"
DISABLE_LS_COLORS="true"

# Plugins to load
plugins=(
	git
	bundler
	dotenv
	osx
	rake
	rbenv
	ruby
    virtualenv
    zsh-autosuggestions
    zsh-syntax-highlighting
)

setopt HIST_IGNORE_SPACE
autoload -U compinit && compinit

# source $ZSH/oh-my-zsh.sh
# complete -o nospace -C /usr/bin/vault vault
# complete -o nospace -C /usr/bin/terraform terraform

export VAULT_SKIP_VERIFY=true
#source ~/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Applying pywal color scheme automatically
(cat ~/.cache/wal/sequences &)
#source ~/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
