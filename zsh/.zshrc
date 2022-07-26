# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
export EXA_COLORS="su=37;41:sf=30;42:da=38;5;38:.*=38;5;168"
export TERM="xterm-256color"
# export LC_ALL="en_US.UTF-8"
export FONTCONFIG_PATH=/etc/fonts:/usr/share/fonts
DISABLE_MAGIC_FUNCTIONS=true
DOTNET_CLI_TELEMETRY_OPTOUT=1

#; Path to your oh-my-zsh installation.
# Run spectrum_ls to see a list of colors zsh can easily produce and
# which can be used in a theme
# export ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=`whoami`
export ZSH=~/.oh-my-zsh


# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
unsetopt correct_all
unsetopt nomatch
setopt HIST_IGNORE_DUPS
setopt rm_star_silent
setopt globdots
setopt extendedglob
setopt alwaystoend
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    z
    zsh-syntax-highlighting
    zsh-autosuggestions
)
# User configuration
source $ZSH/oh-my-zsh.sh
# ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=green,bold
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
ZSH_AUTOSUGGEST_HISTORY_IGNORE="(cd *)|(*thisvid*)|(*gay*)"
#ZSH_AUTOSUGGEST_MANUAL_REBIND=true
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=069
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=069
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=166
ZSH_HIGHLIGHT_STYLES[comment]=fg=244
ZSH_HIGHLIGHT_STYLES[assign]=fg=216
# ZSH_HIGHLIGHT_STYLES[alias]=fg,green,bold


# zle_highlight=(default:none)
# Source custom and private aliases, env vars, functions
HISTCONTROL=ignoreboth:erasedups
HISTFILE=/home/lhp3t/.bhistory
SAVEHIST=1000000
HISTSIZE=$SAVEHIST
export EDITOR='nvim'
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
alias scanip='sudo airodump-ng wlo1mon'
inspectip() {
    ssid="$2";
    sudo airodump-ng -c $1 --bssid $2 -w ~/bak/p wlo1mon;
}
deauthip() {
    bsid="$1";
    sudo aireplay-ng -0 5 -a "$ssid" -c "$1" wlo1mon;
}
alias dh='dirs -v'
alias hcx='hcxpcaptool '
alias c='cat -n'
alias py='ipython'
alias jm='cd ~/workstation/apache-jmeter-5.3/bin && sh ./jmeter.sh'
alias pyview='python ~/Desktop/getView.py'
alias strans='gsettings get org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ background-transparency-percent'
alias ain='apt info'
alias ais='apt search'
alias af='apt-file list'

alias lsr='ll -s size'
alias ltr='exa -Gxabls newest'
alias l='ll --no-user'
alias ll='COLUMNS=$(elgrid) exa -Gxabl --group-directories-first --no-icons'
alias ls='exa -Gxab --group-directories-first --icons'
alias lk='exa -lab --icons'
alias lss='/bin/ls'

alias v4='v4l2-ctl'
alias ram='free -gwh'
alias lfrc='vim ~/.config/lf/lfrc'
alias brc='vim ~/.bashrc'
alias zrc='vim ~/.zshrc'
alias ccc='clear && clear'
alias pp='ps auxf --sort=pcpu'
alias dm='dmesg'
alias aptup='sudo apt update && apt list --upgradable'
alias scrc='scrcpy --shortcut-mod=lalt,lsuper -S -b4M -m1600 -f --render-driver opengles2 --window-borderless --max-fps 45 --no-mipmaps'
alias acac='sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches" && sudo systemd-resolve --flush-caches'
alias sudo='sudo '
# alias sudo=$'nocorrect sudo\t'
alias prun='__NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-0 __VK_LAYER_NV_optimus=NVIDIA_only __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias igt='intel_gpu_top'

alias prc='vim ~/.p10k.zsh'
alias vrc='vim ~/.vimrc'
alias tmrc='vim ~/.tmux.conf'

alias -g GR='| grep -iE'
alias -g T='| tail -n'
alias -g H='| head -n'
alias ff='ffmpeg -hwaccel cuda -hwaccel_output_format cuda -hide_banner -loglevel warning -stats -y '
alias fm='ffmpeg -hwaccel cuda -hide_banner -loglevel warning -stats -y '
alias dL='dpkg -L '
alias dS='dpkg -S '
alias hh='du -sh '
alias t='l -TL 3 '

elgrid () {
    mlen=$(ls -1 | wc -L );
    if (( 60 <= $mlen && $mlen <= 90 )); then
        echo 190;
    else
        if (( 30 <= $mlen && $mlen < 60 )); then
            echo 170;
        else
            echo "auto";
        fi
    fi
}

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^[H' 'sudo service ssh start\n'
bindkey -s '^[S' 'ssh zlabHP\n'
bindkey -s '^o' 'lfcd\n'
bindkey -s "^T" '\C-x\C-e'
calc () {
	echo $1 | bc -l
}
xdif(){
    diff -y <(eval ${1:-''}) <(eval ${2:-''})
}
upf(){
    scp "$1" zlabHP:~/workstation/
}
fst(){
   history GR "${@:-*}"
}
hst(){
   history -E -50000 GR "${@:-*}"
}
apl(){
    apt list -i | grep -E "$@"
}
sr(){
    journalctl --no-hostname -n "${1:-500}" | ccze -A | less -R +G
}
jr(){
    journalctl --no-hostname -b -k -n "${1:-500}" ${2:-} | ccze -A | less -R +G
}
slogn(){
    tail -n "${1:-500}" /var/log/syslog | ccze -A -o nolookups | less -R +G
}
slog(){
    tail -n "${1:-200}" -f /var/log/syslog | ccze -A -o nolookups
}
cnt(){
    for c in ${*}; do
        if [[ -f "$c" ]]; then
            wc -l "$c";
        else
            ll "$c" | wc -l;
        fi
    done;
}
show_colors(){
    for i in {0..255}; do
        print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'};
    done;
}
export PATH="/usr/local/cuda/bin:/usr/local/sbin:/home/lhp3t/.cargo/bin:$PATH"
export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export CPLUS_INCLUDE_PATH=/usr/local/cuda/include
export CDPATH=/mnt/sda/:/home/lhp3t/:/mnt/sda/Home2/MiscZ/:/media/lhp3t/
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['<Super>s']"
# gsettings set org.gnome.settings-daemon.plugins.media-keys increase-text-size "['<Super><Shift><KP_Add>']"
# gsettings set org.gnome.settings-daemon.plugins.media-keys decrease-text-size "['<Super><Shift><KP_Minus>']"

export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 135; tput setab 0)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

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
        touch /home/lhp3t/Desktop/zrcc
    else
        export PATH="/home/lhp3t/Program/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# synclient TapButton1=1 TapButton2=3 TapButton3=2 HorizTwoFingerScroll=1 VertTwoFingerScroll=1 PalmDetect=1 VertEdgeScroll=0
#export GTK_IM_MODULE=ibus
#export GTK3_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT4_IM_MODULE=ibus
#export CLUTTER_IM_MODULE=ibus
#ibus-daemon -drx
export LF_COLORS="${LS_COLORS/ow=34;42/ow=30;42}"

