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

# disk usage alias
alias du='du -h'
alias df='df -h'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ..='cd ..'
alias subl="/usr/bin/subl"
alias open="xdg-open"
alias bd=". bd -s" # back up to some earlier directory, much better than cd ../../.. lol
alias rm=trash # be careful with rm
alias ipynb="ipython notebook"

# SML, Racket, and Dr.Racket
alias sml='rlwrap sml'
alias dr=drracket

# R, RStudio
alias rs=rstudio

# Mathematica
alias maca=mathematica

# Git alias for the lazy. The three below are my most commonly used ones
alias addA='git add -A'
alias pull='git pull origin master'
alias push='git push origin master'
alias commit='git commit -am'
alias st='git status'

alias pullgh='git pull origin gh-pages' # for github pages
alias pushgh='git push origin gh-pages'

alias pullhk='git pull heroku master' # for heroku
alias pushhk='git push heroku master'

alias chmaster='git checkout master'
alias chgh='git checkout gh-pages'
alias branch='git checkout -b'
alias delbranch='git branch -d'

# Virtual Env
alias de='deactivate'

# class alias. Always remember to clear and renew after each semester
alias s199="ssh cs199-xs@hive4.cs.berkeley.edu"
alias s70="ssh cs70-re@hive4.cs.berkeley.edu"
alias s161="ssh cs161-py@hive22.cs.berkeley.edu"
alias s189="ssh cs189-fx@hive4.cs.berkeley.edu"
alias s164="ssh cs164-au@hive4.cs.berkeley.edu"
alias s135="ssh s135-1007801@98.143.38.105"
alias s135scf="ssh s135-1007801@scf-ug01.berkeley.edu"
alias sis="ssh khoatran@ischool.berkeley.edu"

# Stat 135 Cloud
alias cloud135="rdesktop -u s135-1007801 98.143.38.105"

# SAAS Book VM
alias s169vm="ssh -p 3022 saasbook@127.0.0.1"
function scp169vm() {
    scp -r $1 -P 3022 saasbook@127.0.0.1:~/$2
}

# CS 161's pwnable VM (project 2 Spr14)
#alias s161vm="ssh vsftpd@192.168.56.101"
#function scp161vm() {
#    scp -r $1 vsftpd@192.168.56.101:~/$2
#}

# CS 161's nethack VM (project 3 Spr14)
alias s161-q1="ssh q1-student@192.168.56.101"
function scp161-q1() {
    scp -r $1 q1-student@192.168.56.101:~/$2
}
alias s161-q2="ssh q2-student@192.168.56.101"
function scp161-q2() {
    scp -r $1 q2-student@192.168.56.101:~/$2
}
alias s161-q3="ssh q3-student@192.168.56.101"
function scp161-q3() {
    scp -r $1 q3-student@192.168.56.101:~/$2
}

# EE122 Project 3
#alias s122vm="ssh ee122@172.16.122.2"
#function scp122vm() {
#    scp -r $1 ee122@172.16.122.2:~/$2
#}

# class-related functions to automate things
function scp199() {
    scp -r $1 cs199-xs@hive4.cs.berkeley.edu:~/$2
}
function scp70() {
    scp -r $1 cs70-re@hive4.cs.berkeley.edu:~/$2
}
function scp161() {
    scp -r $1 cs161-py@hive22.cs.berkeley.edu:~/$2
}
function scp189() {
    scp -r $1 cs189-fx@hive4.cs.berkeley.edu:~/$2
}
function scp164() {
    scp -r $1 cs164-au@hive4.cs.berkeley.edu:~/$2
}
function scp135() {
    scp -r $1 s135-1007801@98.143.38.105:~/$2
}
function scpis() {
    scp -r $1 khoatran@ischool.berkeley.edu:~/$2
}
