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

setopt list_packed
setopt nolistbeep
setopt nobeep
autoload -Uz vcs_info    
setopt prompt_subst    

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ] && [ "$TERM" != "rxvt-unicode-256color" ]; then
    install_powerline_precmd
fi
