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
alias up="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade"

# SML, Racket, and Dr.Racket
alias sml='rlwrap sml'
alias dr=drracket

# R, RStudio
alias rs=rstudio

# Mathematica
alias maca=mathematica

# IntelliJ
alias idea=idea.sh

# Android Studio
alias studio=studio.sh

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
alias piplatest='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install --upgrade'

# class alias. Always remember to clear and renew after each semester
alias s199="ssh cs199-xs@star.cs.berkeley.edu"
alias s70="ssh cs70-tf@star.cs.berkeley.edu"
alias s164="ssh cs164-dm@star.cs.berkeley.edu"
alias s194="ssh cs194-ku@star.cs.berkeley.edu"
alias sis="ssh khoatran@ischool.berkeley.edu"

# SAAS Book VM
alias s169vm="ssh -p 3022 saasbook@127.0.0.1"
function scp169vm() {
    scp -r $1 -P 3022 saasbook@127.0.0.1:~/$2
}

# class-related functions to automate things
function scp199() {
    scp -r $1 cs199-xs@star.cs.berkeley.edu:~/$2
}
function scp70() {
    scp -r $1 cs70-tf@star.cs.berkeley.edu:~/$2
}
function scp164() {
    scp -r $1 cs164-dm@star.cs.berkeley.edu:~/$2
}
function scp194() {
    scp -r $1 cs194-ku@star.cs.berkeley.edu:~/$2
}
