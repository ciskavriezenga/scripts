source ~/.git-completion.bash

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


if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}";
#		echo -e "${1}${branchName}${2}${s}";
	else
		return;
	fi;
}



if tput setaf 1 &> /dev/null; then
	tput sgr0; # reset colors
#	bold=$(tput bold);
	reset=$(tput sgr0);
	# Solarized colors, taken from http://git.io/solarized-colors.
	black=$(tput setaf 0);
	blue=$(tput setaf 33);
	cyan=$(tput setaf 37);
	green=$(tput setaf 64);
	orange=$(tput setaf 166);
	purple=$(tput setaf 125);
	red=$(tput setaf 124);
	violet=$(tput setaf 61);
	white=$(tput setaf 15);
	yellow=$(tput setaf 136);
else
	bold='';
	reset="\e[0m";
	black="\e[1;30m";
	blue="\e[1;34m";
	cyan="\e[1;36m";
	green="\e[1;32m";
	orange="\e[1;33m";
	purple="\e[1;35m";
	red="\e[1;31m";
	violet="\e[1;35m";
	white="\e[1;37m";
	yellow="\e[1;33m";
fi;

darkgrey="\e[1;30m";


PS1="\[\033[${orange}\]\u";
#PS1+='\[${yellow}\]\w'; # working directory
#PS1+="\$(prompt_git \"\[${white}\] on \[${violet}\]\" \"\[${blue}\]\")"; # Git repository details
#PS1+='\n';
#PS1+='\[${white}\]\$ \[${reset}\]'; # `$` (and reset color)
PS1+=': \[\033[${yellow}\]\\\W\[\033[00m\]'
PS1+="\$(prompt_git \"\[${reset}\] on \[${darkgrey}\]\" \"\[${blue}\]\")"; # Git repository details
PS1+=" \[${reset}\]\$ ";


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
alias gitA='git add'
alias gitS='git status'
alias gitAa='git add --all'
alias gitCm='git commit -m'
alias gitCH='git checkout'
alias gitPo='git pull origin'
alias gitPod='git pull origin develop'
alias gitPHo='git push origin'
alias gitPHod='git push origin develop'
alias sgit='sudo git'
alias sgitA='sudo git add'
alias sgitAa='sudo git add --all'
alias sgitCm='sudo git commit -m'
alias sgitCH='sudo git checkout'
alias sgitPo='sudo git pull origin'
alias sgitPod='sudo git pull origin develop'
alias sgitPHo='sudo git push origin'
alias sgitPHod='sudo git push origin develop'
alias server='cd /Library/WebServer/Documents/'
function cl {
  cd "$@" && ls -F
}
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


export PATH=${PATH}:/usr/local/opt/dart/bin
export PATH="$PATH":"~/.pub-cache/bin"
