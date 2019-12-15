# Created by newuser for 5.7.1
autoload -U compinit
compinit
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                             /usr/local/git/bin
zstyle ':completion:*:default' menu select=2
cd ()
{
    builtin cd "$@" && ls
}
export PATH="$PATH:/home/yuki/.gem/ruby/1.9.1/bin"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export PATH="$PATH:/home/yuki/.review/bin/"
export PATH="$PATH:/home/yuki/.cargo/bin/"
export PATH="$PATH:/usr/lib/distcc/bin/"
export PATH="$PATH:/home/yuki/zen-linux-x86_64-0.8.20191124+552247019/"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
