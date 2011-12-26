# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias emacs='emacs -nw'
alias watch='watch --i=0'
alias phpinfo='php -r "phpinfo();"'
alias snmpwalk='snmpwalk -v2c -c<comstr>'
