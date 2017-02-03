# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

#PS1="\[\e[1;32m\]->>\[$(tput sgr0)\]"
PS1="\[\e[37m\]->>"

export EDITOR=nano
export TERM=xterm-256color


alias ls='ls --color=auto'
alias dir='dir --color'
alias ls='ls --color'
alias x='xrdb -merge ~/.Xresources'
alias qlop='sudo qlop -tHvg chromium'
alias r='rtorrent -o http_capath=/etc/ssl/certs'
alias wtf='dmesg'
alias s='screenfetch'
alias g='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias es='sudo emerge --sync'
alias dc='LC_ALL=C sudo emerge -p --depclean'
alias rr='LC_ALL=C sudo emerge @preserved-rebuild'
alias mr='LC_ALL=C sudo emerge --ask @module-rebuild'
alias chu='LC_ALL=C sudo emerge --ask --update --changed-use --deep @world'
alias duv='LC_ALL=C sudo emerge -uDNav @world --with-bdeps=y --keep-going'


man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}


eval $(dircolors -b $HOME/.dir_colors)
