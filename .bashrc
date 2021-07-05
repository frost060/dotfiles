# source ~/dev/dotfiles/git-prompt.sh
source ~/dev/dotfiles/git-completion.bash

# GIT_PS1_SHOWDIRTYSTATE=1
# GIT_PS1_SHOWSTASHSTATE=1
# GIT_PS1_SHOWUNTRACKEDFILES=1
# GIT_PS1_STATESEPARATOR=

# # better prompt
# CYAN='\[\e[38;5;14m\]'
# GREEN='\[\e[38;5;10m\]'
# YELLOW='\[\e[38;5;11m\]'
# RED='\[\e[38;5;13m\]'
# BLUE='\[\e[34m\]'
# RESET='\[\e[0m\]'

# # PS1="${CYAN}\t ${GREEN}\u@\h ${YELLOW}\w ${RED}\$(__git_ps1 '(%s)') ${RESET}\n🍟 "
# PS1="${BLUE}\w ${RESET}\$(__git_ps1 '[%s]') ${RESET}$"
# #🐍 🐳 🔥 🦄 🍔 🍺 🥂 🍷 🥃 🍸 🍹 🧉 🍾 ⏳ 🍟 🍕 

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[34m\]\w\[\e[m\]\[\e[37m\]\`parse_git_branch\`\[\e[m\]\\$ "

# better list
export LSCOLORS=Dxcxgxfxbxegedabagdxdx
alias ls='ls -lGh'


