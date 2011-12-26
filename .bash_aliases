# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias emacs='emacs -nw'
alias syncman='ssh oak-dog-batch001.say -t sudo -iu syncman'
alias dnsmoke='ssh root@oak-ss-admin004 "/etc/init.d/named status" && ssh root@oak-ss-admin003 "/etc/init.d/named status"'
alias watch='watch --i=0'
alias phpinfo='php -r "phpinfo();"'
alias snmpwalk='snmpwalk -v2c -c<comstr>'
