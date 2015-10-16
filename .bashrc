# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias mkdir='mkdir -pv'
# install  colordiff package :)
alias diff='colordiff'
alias mount='mount |column -t'
# handy short cuts #
alias h='history'
alias j='jobs -l'
# set vim as default
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'
# show open ports
alias ports='netstat -tulanp'
# resume wget
alias wget='wget -c'
alias binds="bind -P | grep 'can be'"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#superBash
__git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
__git_branch_color="\[\033[31m\]"
__last_color="\[\033[00m\]"
__pwd='`pwd`'
PS1=$__git_branch_color$__git_branch$__pwd"\n\e[33;41m\[$(tput bold)\]\D{%T} $"$__last_color
#PS1=$__git_branch_color$__git_branch"\[\033[s\033[0;0H\033[0;41m\033[K\033[1;33m\t\033[0m\033[u\]\n\n\[\033[0;41m\]<\u:\W>\$\[\033[0m\]"$__last_color
GIT_COMMITTER_NAME="Emiliano Lourbet"
GIT_AUTHOR_NAME="Emiliano Lourbet"

#java env
#export JAVA_HOME=$HOME/java/jdk1.6.0_32
#export JAVA_HOME=$HOME/java/jdk1.6.0_45
#export JAVA_HOME=$HOME/java/jdk1.7.0_25
export JAVA_HOME=$HOME/java/jdk1.8.0_40

#scala home
#export SCALA_HOME=$HOME/scala/scala-2.11.2 


#export M2_HOME=/home/taitooz/java/apache-maven-2.2.1
#export M2_REPO=/home/taitooz/.m2
#export M2=$M2_HOME/bin

export M2_HOME=$HOME/java/apache-maven-3.1.0
export M2_REPO=$HOME/.m2
export M2=$M2_HOME/bin

#export MAVEN_OPTS="-Xms256m -Xmx512m"
#export MAVEN_OPTS="-XX:MaxPermSize=192m -Xmx768m -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"
export MAVEN_OPTS="-Xms256m -Xmx768m"

export ANT_HOME=$HOME/java/ant-1.8.2
#export CATALINA_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"
export CATALINA_OPTS="-Xms1024m -Xmx1024m"
export TOMCAT_HOME=$HOME/java/apache-tomcat-6.0.36
#export CATALINA_HOME=/home/taitooz/java/apache-tomcat-6.0.36
export SVN_EDITOR=vim
export CASSANDRA_HOME=~/cassandra
export PATH=$PATH:$CASSANDRA_HOME/bin

export HADOOP_HOME=$HOME/java/hadoop-2.7.0

#proxy
#export http_proxy=http://proxy.corp.globant.com:3128
#export https_proxy=https://proxy.corp.globant.com:3128
#export no_proxy=localhost,127.0.0.0/8,*.local


export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/share/pkgconfig"
#PATH
PATH=$PATH:$M2:${ANT_HOME}/bin:$HOME/scripts:$HOME/pScripts:$JAVA_HOME/bin

#NODE NVM
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
#nvm use v0.10.35
#nvm use v0.10.28




#mandel.sh
#consoleCLock
#history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
#remove beep 
xset b off
xset b 0 0 0

