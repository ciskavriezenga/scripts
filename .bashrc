# Put this file in your home folder under the name .bashrc and
#  create a file .profile containing just this one cryptic line that
#  reads and interprets the .bashrc every time you open a new terminal:
#
# . ~/.bashrc
#


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


# BASH prompt escape sequences
#
#  \a     an ASCII bell character (07)
#  \d     the date  in  "Weekday  Month  Date"  format (e.g., "Tue May 26")
#  \e     an ASCII escape character (033)
#  \h     the hostname up to the first `.'
#  \H     the hostname
#  \j     the  number of jobs currently managed by the shell
#  \l     the basename of the shell's terminal  device name
#  \n     newline
#  \r     carriage return
#  \s     the  name  of  the shell, the basename of $0
#         (the portion following the final slash)
#  \t     the current time in 24-hour HH:MM:SS format
#  \T     the current time in 12-hour HH:MM:SS format
#  \@     the current time in 12-hour am/pm format
#  \u     the username of the current user
#  \v     the version of bash (e.g., 2.00)
#  \V     the release of bash,  version  +  patchlevel (e.g., 2.00.0)
#  \w     the current working directory
#  \W     the  basename of the current working directory
#  \!     the history number of this command
#  \#     the command number of this command
#  \$     if the effective UID is 0, a #, otherwise  a $
#  \nnn   the  character  corresponding  to  the octal number nnn
#  \\     a backslash
#  \[     begin a sequence of non-printing characters, which could be used
#         to embed a terminal control sequence into the prompt
#  \]     end a sequence of non-printing characters


PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \$ '


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


#
# Add some directories to the standard PATH. Current dir '.' comes first
#
# PATH=.:$PATH:/sbin:/usr/sbin:/usr/local/bin:${HOME}/scripts

# alias h=history
alias ls='ls -a'
# alias la='/bin/ls -aC'
# alias lal='/bin/ls -alt'
# alias lalh='lal | head'
# alias l='/bin/ls -lt'
# alias lh='l | head'
# alias ldir='find . -type d -maxdepth 1'
# alias m='more'
alias rm='rm -i'

# alias clera='clear'

# alias hexdump='hexdump -C'
# alias gvim='gvim -geometry 80x40'
# alias df='df -k'


# cl () {  cd $*; ls; }

# alias mvim='/Applications/MacVim.app/Contents/MacOS/MacVim'

