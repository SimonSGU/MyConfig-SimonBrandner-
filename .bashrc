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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
    # PS1='\t:${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="\[\e[0;31m\]\t:\[\e[0;32m\]\u\[\e[0;32m\]@\[\e[0;32m\]\h\[\e[0;36m\]\w\[\e[0m\]\\$\[$(tput sgr0)\] "
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





######################################################################################
# My settings
######################################################################################



# Enable colors 
#############################################################################################
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01' # colored GCC warnings and errors
#############################################################################################
# Enable colors 



# Aliases
###################################################################
alias ll='ls -l'
alias la='ls -A'
alias l='ls -la'

alias aptup='sudo aptitude update && sudo aptitude upgrade'

alias reboot='/sbin/reboot'
alias poweroff='/sbin/poweroff'
#####################################################################
# Aliases



# Load aliases from bash_aliases
######################################################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
#####################################################
# Load aliases from bash_aliases



# Enable programmable completion features 
###################################################################################
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
####################################################################################
# Enable programmable completion features



neofetch # Run neofetch




##  Powerline
################################################################################
bash_prompt_command() {
	local pwdmaxlen=25 # How many characters of the $PWD should be kept
	local trunc_symbol=".." # Indicate that there has been dir truncation
	
	# Store local dir
	local dir=${PWD##*/}    

	pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen )) # Which length to use
	NEW_PWD=${PWD/#$HOME/\~}
	local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))

	# Generate name
	if [ ${pwdoffset} -gt "0" ]
	then
		NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
		NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
	fi
}




##
##	GENERATE A FORMAT SEQUENCE
##
format_font()
{
	## FIRST ARGUMENT TO RETURN FORMAT STRING
	local output=$1


	case $# in
	2)
		eval $output="'\[\033[0;${2}m\]'"
		;;
	3)
		eval $output="'\[\033[0;${2};${3}m\]'"
		;;
	4)
		eval $output="'\[\033[0;${2};${3};${4}m\]'"
		;;
	*)
		eval $output="'\[\033[0m\]'"
		;;
	esac
}



##
## COLORIZE BASH PROMT
##
bash_prompt() {

	############################################################################
	## COLOR CODES                                                            ##
	## These can be used in the configuration below                           ##
	############################################################################
	
	## FONT EFFECT
	local      NONE='0'
	local      BOLD='1'
	local       DIM='2'
	local UNDERLINE='4'
	local     BLINK='5'
	local    INVERT='7'
	local    HIDDEN='8'
	
	
	## COLORS
	local   DEFAULT='9'
	local     BLACK='0'
	local       RED='1'
	local     GREEN='2'
	local    YELLOW='3'
	local      BLUE='4'
	local   MAGENTA='5'
	local      CYAN='6'
	local    L_GRAY='7'
	local    D_GRAY='60'
	local     L_RED='61'
	local   L_GREEN='62'
	local  L_YELLOW='63'
	local    L_BLUE='64'
	local L_MAGENTA='65'
	local    L_CYAN='66'
	local     WHITE='67'
	
	
	## TYPE
	local     RESET='0'
	local    EFFECT='0'
	local     COLOR='30'
	local        BG='40'
	
	
	## 256 COLOR CODES
	local NO_FORMAT="\[\033[0m\]"
	local ORANGE_BOLD="\[\033[1;38;5;208m\]"
	local TOXIC_GREEN_BOLD="\[\033[1;38;5;118m\]"
	local RED_BOLD="\[\033[1;38;5;1m\]"
	local CYAN_BOLD="\[\033[1;38;5;87m\]"
	local BLACK_BOLD="\[\033[1;38;5;0m\]"
	local WHITE_BOLD="\[\033[1;38;5;15m\]"
	local GRAY_BOLD="\[\033[1;90m\]"
	local BLUE_BOLD="\[\033[1;38;5;74m\]"

	
	
	# Default color combination
	#######################################
	local FONT_COLOR_1=$WHITE
	local BACKGROUND_1=$BLUE
	local TEXTEFFECT_1=$BOLD
	
	local FONT_COLOR_2=$WHITE
	local BACKGROUND_2=$L_BLUE
	local TEXTEFFECT_2=$BOLD
	
	local FONT_COLOR_3=$D_GRAY
	local BACKGROUND_3=$BLUE
	local TEXTEFFECT_3=$BOLD
	
	local FONT_COLOR_4=$D_GRAY
	local BACKGROUND_4=$BLUE
	local TEXTEFFECT_4=$BOLD

	local PROMT_FORMAT=$BLUE_BOLD 
	#######################################
	# Default color combination
	
	# $USER = simon color config
	######################################
	if [ "$USER" = simon ]; then
		FONT_COLOR_1=$WHITE; 
		FONT_COLOR_2=$WHITE; 
		FONT_COLOR_3=$WHITE;
		FONT_COLOR_4=$WHITE;

		BACKGROUND_1=$RED; 
		BACKGROUND_2=$CYAN;
		BACKGROUND_3=$BLUE;
		BACKGROUND_4=$D_GRAY;

		TEXTEFFECT_1=$BOLD
		TEXTEFFECT_2=$BOLD
		TEXTEFFECT_3=$BOLD	
		TEXTEFFECT_4=$BOLD

		PROMT_FORMAT=$WHITE_BOLD
	fi
	######################################
	# $USER = simon color config


	# $USER = root color config
	########################################
	if [ "$USER" = root ]; then
		FONT_COLOR_1=$WHITE; 
		FONT_COLOR_2=$WHITE;
		FONT_COLOR_3=$WHITE;
		FONT_COLOR_4=$WHITE; 

		BACKGROUND_1=$RED;
		BACKGROUND_2=$RED;
		BACKGROUND_3=$RED; 
		BACKGROUND_4=$RED;

		TEXTEFFECT_1=$BOLD
		TEXTEFFECT_2=$BOLD
		TEXTEFFECT_3=$BOLD
		TEXTEFFECT_4=$BOLD

		PROMT_FORMAT=$RED_BOLD
	fi
	########################################
	# $USER = root color config
	
	


	
	############################################################################
	## TEXT FORMATING                                                         ##
	## Generate the text formating according to configuration                 ##
	############################################################################
	
	## CONVERT CODES: add offset
	FC1=$(($FONT_COLOR_1+$COLOR))
	BG1=$(($BACKGROUND_1+$BG))
	FE1=$(($TEXTEFFECT_1+$EFFECT))
	
	FC2=$(($FONT_COLOR_2+$COLOR))
	BG2=$(($BACKGROUND_2+$BG))
	FE2=$(($TEXTEFFECT_2+$EFFECT))
	
	FC3=$(($FONT_COLOR_3+$COLOR))
	BG3=$(($BACKGROUND_3+$BG))
	FE3=$(($TEXTEFFECT_3+$EFFECT))
	
	FC4=$(($FONT_COLOR_4+$COLOR))
	BG4=$(($BACKGROUND_4+$BG))
	FE4=$(($TEXTEFFECT_4+$EFFECT))
	

	## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
	local TEXT_FORMAT_1
	local TEXT_FORMAT_2
	local TEXT_FORMAT_3
	local TEXT_FORMAT_4	
	format_font TEXT_FORMAT_1 $FE1 $FC1 $BG1
	format_font TEXT_FORMAT_2 $FE2 $FC2 $BG2
	format_font TEXT_FORMAT_3 $FC3 $FE3 $BG3
	format_font TEXT_FORMAT_4 $FC4 $FE4 $BG4
	
	
	NOW=`date '+%H:%M:%S'`; # Time

	# GENERATE PROMT SECTIONS
	local PROMT_TIME=$"$TEXT_FORMAT_1\$NOW" 
	local PROMT_USER=$"$TEXT_FORMAT_2 \u "
	local PROMT_HOST=$"$TEXT_FORMAT_3 \h "
	local PROMT_PWD=$"$TEXT_FORMAT_4 \${NEW_PWD} "
	local PROMT_INPUT=$"$PROMT_FORMAT "
	


	############################################################################
	## SEPARATOR FORMATING                                                    ##
	## Generate the separators between sections                               ##
	## Uses background colors of the sections                                 ##
	############################################################################
	
	## CONVERT CODES
	TSFC1=$(($BACKGROUND_1+$COLOR))
	TSBG1=$(($BACKGROUND_2+$BG))
	
	TSFC2=$(($BACKGROUND_2+$COLOR))
	TSBG2=$(($BACKGROUND_3+$BG))
	
	TSFC3=$(($BACKGROUND_3+$COLOR))
	TSBG3=$(($BACKGROUND_4+$BG))
	
	TSFC4=$(($BACKGROUND_4+$COLOR))
	TSBG4=$(($DEFAULT+$BG))



	## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
	local SEPARATOR_FORMAT_1
	local SEPARATOR_FORMAT_2
	local SEPARATOR_FORMAT_3
	local SEPARATOR_FORMAT_4
	format_font SEPARATOR_FORMAT_1 $TSFC1 $TSBG1
	format_font SEPARATOR_FORMAT_2 $TSFC2 $TSBG2
	format_font SEPARATOR_FORMAT_3 $TSFC3 $TSBG3
	format_font SEPARATOR_FORMAT_4 $TSFC4 $TSBG4
	

	# GENERATE SEPARATORS WITH FANCY TRIANGLE
	local TRIANGLE=$'\uE0B0'	
	local SEPARATOR_1=$SEPARATOR_FORMAT_1$TRIANGLE
	local SEPARATOR_2=$SEPARATOR_FORMAT_2$TRIANGLE
	local SEPARATOR_3=$SEPARATOR_FORMAT_3$TRIANGLE
	local SEPARATOR_4=$SEPARATOR_FORMAT_4$TRIANGLE




	# WINDOW TITLE
	############################################################################
	case $TERM in
	xterm*|rxvt*)
		local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
		;;
	*)
		local TITLEBAR=""
		;;
	esac
	############################################################################
	# WINDOW TITLE



	# Generate promt and remove format from the rest                         
	############################################################################
	PS1="$TITLEBAR${PROMT_TIME}${SEPARATOR_1}${PROMT_USER}${SEPARATOR_2}${PROMT_HOST}${SEPARATOR_3}${PROMT_PWD}${SEPARATOR_4}${PROMT_INPUT}"
	############################################################################
	# Generate promt and remove format from the rest                         



	## For terminal line coloring, leaving the rest standard
	none="$(tput sgr0)"
	trap 'echo -ne "${none}"' DEBUG
}




################################################################################
##  MAIN                                                                      ##
################################################################################

##	Bash provides an environment variable called PROMPT_COMMAND. 
##	The contents of this variable are executed as a regular Bash command 
##	just before Bash displays a prompt. 
##	We want it to call our own command to truncate PWD and store it in NEW_PWD
PROMPT_COMMAND=bash_prompt_command

##	Call bash_promnt only once, then unset it (not needed any more)
##	It will set $PS1 with colors and relative to $NEW_PWD, 
##	which gets updated by $PROMT_COMMAND on behalf of the terminal
bash_prompt
unset bash_prompt


export EDITOR=emacsclient
export VISUAL=emacsclient


### EOF ###
