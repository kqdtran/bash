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

alias ..='cd ..'
alias subl="/usr/bin/subl"
alias open="xdg-open"
alias bd=". bd -s" # back up to some earlier directory, much better than cd ../../.. lol
alias rm=trash # be careful with rm
alias ipynb="ipython notebook"

# Git alias for the lazy
alias addA='git add -A'
alias pull='git pull origin master'
alias push='git push origin master'
alias commit='git commit -am'
alias st='git status'

# class alias. Always remember to clear and renew after each semester
alias s199="ssh cs199-xs@nova.cs.berkeley.edu" # don't clear this one yet
alias s170="ssh cs170-vq@nova.cs.berkeley.edu"
alias s122="ssh ee122-kk@nova.cs.berkeley.edu"
alias s122vm="ssh ee122@172.16.122.2"

# class-related functions to automate things
function scp199() {
    scp -r $1 cs199-xs@nova.cs.berkeley.edu:~/$2
}
function scp170() {
    scp -r $1 cs170-vq@nova.cs.berkeley.edu:~/$2
}
function scp122() {
    scp -r $1 ee122-kk@nova.cs.berkeley.edu:~/$2
}
function scp122vm() {
    scp -r $1 ee122@172.16.122.2:~/$2
}
