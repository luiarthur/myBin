# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

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

test -s ~/.bashrc.local && . ~/.bashrc.local || true

### My Own Settings
shopt -s extglob   # Enable extended globbing
set -o noclobber   # Dont clobber existing files on redirection
set -o vi

# Commands for remembering a directory
# alias dir="ls --color=auto -lFh"
# alias dir.all="ls --color=auto -alFh"

# Commands for not overwriting files
alias mv="/bin/mv -i"
alias cp="/bin/cp -i"
alias rm="/bin/rm -i"

# Alias
alias pdo="/usr/bin/pdflatex -output-directory=out"
alias llp="cd ~/Lilypond"
alias dir="ls -hla "
alias taro="tar -zxvf"
alias tma="tmux attach -t"
alias s="aspell --lang=en_GB -t -c"
# Personal (BYU)
alias 536="cd ~/School/Winter2014/Stat536/Homework"
alias 538="cd ~/School/Winter2014/Stat538/Final"
alias 642="cd ~/School/Winter2014/Stat642/Homework"
alias 651="cd ~/School/Fall2014/Stat651"
alias 666="cd ~/School/Fall2014/Stat666"
alias amazon="ssh -i ~/bin/sonata.pem ubuntu@52.11.22.119"
# UCSC
alias firedance="ssh -X alui2@firedance.soe.ucsc.edu"
alias citrisdance="ssh -X alui2@citrisdance.soe.ucsc.edu"
alias grape="ssh -X alui2@grape.soe.ucsc.edu"
alias bin="cd ~/Repo/myBin"

# Set-up prompt
PS1="\h:\W$ "

export EDITOR=vim
export PATH=~/bin:$PATH
export ARMA_HOME=~/Libs/armadillo/include
# OpenBLAS
export OPENBLAS_HOME=~/Libs/OpenBLAS/install_dir/lib
export LD_LIBRARY_PATH=$OPENBLAS_HOME:$LD_LIBRARY_PATH
export OPENBLAS_NUM_THREADS=nproc
# Julia
#export JULIA_HOME=~/julia/usr/bin
#export PATH=$JULIA_HOME:$PATH


# Go
#export GOROOT=~/go # Creating a variable for the go path
#export PATH=$GOROOT/bin:$PATH # For using go

# Scala
#export PATH=~/bin/sbt/bin:$PATH # sbt is a building tool for scala.
# To get scala, download the package from:
#   http://www.scala-lang.org/download/
# And follow the instructions in:
#   http://www.scala-lang.org/download/install.html
#SCALA_HOME=$HOME/scala-2.11.6
#export SCALA_HOME
#PATH=$PATH:$SCALA_HOME/bin
#export PATH

# gcalcli:
alias gcalqa="gcalcli quick --calendar='Personal' --duration 0"
alias gcaladd="gcalcli add --calendar='Personal'"
alias gcalrm="gcalcli delete"
alias gcalls="gcalcli list"
alias gcalw="gcalcli calw"
alias gcaledit="gcalcli edit"
export GREP_COLOR='01;38;5;226'

# Python Setup
export PYTHONSTARTUP=~/.pythonrc
