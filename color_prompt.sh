# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# git branch
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

case "$TERM" in
screen*|xterm*|rxvt*|linux*)
	# host
	p_host='\[\e[33m\]\h\[\e[37m\] > '
	# user color
	if [ "$UID" = 0 ]; then
		p_user_color='\[\e[31m\]'
	else
		p_user_color='\[\e[32m\]'
	fi
	# user
	p_user='\u\[\e[37m\] > '
	# current dir
	p_pwd='\[\e[36m\]\w\[\e[37m\] > '
	# root marker
	p_root_marker='\$\[\e[37m\] > '
	# reset color
	p_reset_color='\[\e[0m\]'
	# window title
	if [ $TERM = "linux" ]
	then
		p_window_title=""
	else
		p_window_title='\[\e]0;\h > \u > $PWD\a\]'
	fi
	PS1="$p_window_title$p_host$p_user_color$p_user$p_pwd$p_user_color\$(parse_git_branch)$p_root_marker$p_reset_color"
	;;
*)
	PS1='\h > \u > $PWD > \$ '
	;;
esac
