# Created by azuma for 5.3.1
fpath=(~/.zsh-completions $fpath)
autoload -U compinit
compinit
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                             /usr/local/git/bin
zstyle ':completion:*:default' menu select=2
neofetch
cd ()
{
    builtin cd "$@" && ls
}
export PATH="$PATH:/home/yuki/.gem/ruby/1.9.1/bin"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export PATH="$PATH:/home/yuki/.review/bin/"
export PATH="$PATH:/home/yuki/.cargo/bin/"

function mdtopdf(){
  pandoc $1.md -o $2.pdf -V documentclass=ltjsarticle --pdf-engine=lualatex --self-contained
}
function htmltopdf(){
  pandoc $1.html -o $2.pdf -V documentclass=ltjsarticle --pdf-engine=lualatex
}
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

setopt list_packed
setopt nolistbeep
setopt nobeep

PROMPT='%F{green}%n%f/%m%B%(?.%F{blue}%(!.#. :))%f.%F{red}%(!.#. :()%f)%b '
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

#function powerline_precmd() {
#    PS1="$(powerline-shell --shell zsh $?)"
#}
#
#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}
#
#if [ "$TERM" != "linux" ] && [ "$TERM" != "rxvt-unicode-256color" ]; then
#    install_powerline_precmd
#fi
