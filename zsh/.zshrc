# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
export LC_CTYPE="C.UTF-8"

#; Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Run spectrum_ls to see a list of colors zsh can easily produce and
# which can be used in a theme
# export ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=`whoami`

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
unsetopt correct_all

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-syntax-highlighting)
# User configuration
source $ZSH/oh-my-zsh.sh
# ZSH_HIGHLIGHT_STYLES[alias]=fg,green,bold
# ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=green,bold
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=069
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=069
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
export EDITOR='nvim'

HISTCONTROL=ignoreboth
HISTFILE=/home/lhp3t/.bhistory
# zshopt -s histappend
SAVEHIST=100000
HISTSIZE=50000

# zle_highlight=(default:none)
# Source custom and private aliases, env vars, functions
source ~/dotfiles/zsh/aliases.sh
source ~/dotfiles/zsh/secret-keys.sh
source ~/dotfiles/zsh/secret-functions.sh

# Load in fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use ripgrep to get list of files over find, search hidden files, follow symlinks
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{.git,package-lock.json}"'

#################################################
### Colorize Man pages
#################################################
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CF'
alias v4='v4l2-ctl'
#alias ns='nvidia-smi'
alias brc='vim ~/.bashrc'
alias zrc='vim ~/.zshrc'
alias ccc='clear && clear'
alias pp='ps auxf --sort=pcpu'
alias dm='dmesg'
alias aptup='sudo apt update && apt list --upgradable'
alias scrc='scrcpy --shortcut-mod=lalt,lsuper -S -b4M -m1600 -f --render-driver opengles2 --window-borderless --max-fps 45 --no-mipmaps'
alias acac='sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches" && sudo systemd-resolve --flush-caches'
alias sudo='sudo '
alias prun='__NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-0 __VK_LAYER_NV_optimus=NVIDIA_only __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias igt='sudo intel_gpu_top'

alias prc='vim ~/.p10k.zsh'
alias vrc='vim ~/.vimrc'

hst(){
    history | grep -E "$@"
}
apl(){
    apt list -i | grep -E "$@"
}
dl(){
    dpkg -L "$@"
}
jr(){
    journalctl -n "$@"
}
cnt(){
    for c in ${*}; do
        ll "$c" | wc -l;
    done;
}

export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export CPLUS_INCLUDE_PATH=/usr/local/cuda/include
export CDPATH=/mnt/sda/

gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['<Super>s']"
gsettings set org.gnome.settings-daemon.plugins.media-keys increase-text-size "['<Super><Shift><KP_Add>']"
gsettings set org.gnome.settings-daemon.plugins.media-keys decrease-text-size "['<Super><Shift><KP_Minus>']"

export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#################################################
### Git Stuff
#################################################
export REVIEW_BASE=master
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lhp3t/Program/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lhp3t/Program/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lhp3t/Program/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lhp3t/Program/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# synclient TapButton1=1 TapButton2=3 TapButton3=2 HorizTwoFingerScroll=1 VertTwoFingerScroll=1 PalmDetect=1 VertEdgeScroll=0

