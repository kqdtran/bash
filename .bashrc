# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


######## Some of my own exports #########
#---------------------------------------#
#########################################

# Matlab
export PATH=$PATH:/usr/local/MATLAB/R2012a/bin

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Other IDEs, Pycharm and Intellij
export PATH=/home/khoatran/software/idea-IU-129.161/bin:$PATH
export PATH=/home/khoatran/software/pycharm-2.7.3/bin:$PATH

# autojump to different directory, babay
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

# Scala and SBT
export SCALA_HOME="/usr/local/scala-2.10.1/"
export PATH=$PATH:$SCALA_HOME/bin
export PATH=/usr/bin/sbt/bin:$PATH

# Go-lang
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

# Pig local use
export JAVA_HOME=/usr/lib/jvm/java-7-oracle
export PATH=/home/khoatran/software/pig-0.11.1/bin:$PATH
export PIG_HOME=/home/khoatran/software/pig-0.11.1

# Python startup with history navigation
export PYTHONSTARTUP=/home/khoatran/.pystartup

# virtualenv and virtualenwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# leJOS NXJ
export NXJ_HOME=/home/khoatran/software/leJOS_NXJ_0.9.1beta-3/
export PATH=/home/khoatran/software/leJOS_NXJ_0.9.1beta-3/bin:$PATH

# lenskit, for Coursera's Intro to Recommender System
export PATH=/home/khoatran/software/lenskit-2.0/bin:$PATH

# Anaconda 1.6.1 installer
export PATH=/home/khoatran/software/anaconda/bin:$PATH

# Selenium's Chrome driver
export PATH=/home/khoatran/software/chromedriver:$PATH

# Racket and Dr.Racket
export PATH=/home/khoatran/software/racket/bin:$PATH

# Twitter's Storm
export PATH=/home/khoatran/software/storm-0.9.0.1/bin:$PATH

# Run SML test files
smlrun() {
  echo 'use "'${1%.sml}.sml'";' | rlwrap sml
}