. $HOME/z/z.sh
ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME=powerlevel10k/powerlevel10k

# Useful plugins for Rails development with Sublime Text
plugins=(
	gitfast 
	last-working-dir 
	common-aliases 
	zsh-syntax-highlighting 
	history-substring-search
	zsh-autosuggestions
	web-search
	sudo
)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

source /usr/local/ibmcloud/autocomplete/zsh_autocomplete
# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)
# export KUBECONFIG=/Users/kemal/.bluemix/plugins/container-service/clusters/testcluster/kube-config-mil01-testcluster.yml

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Random loco. When terminal clear
alias clear='[ $[$RANDOM % 10] = 0 ] && sl; clear || clear'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000
export HISTTIMEFORMAT="%d.%m.%Y %T "

# dont keep duplicate in history
HISTCONTROL=ignoredups:ignorespace

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

#-----------
# ALIASES
#-----------

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias r='rlogin'
alias which='type -all'
alias ..='cd ..'
alias ...='cd ../..'
alias l.='ls -d .*'     #list hidden files
alias lss='l --color=always | less'   #colored "l" with less
alias path='echo -e ${PATH//:/\\n}'
alias du='du -kh'
alias df='df -kTh'
alias clear='[ $[$RANDOM % 10] = 0 ] && sl; clear || clear'

# Get External IP / local IPs
alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

alias changes="git diff `git merge-base --fork-point master` --stat"
alias next="{ git ls-files -o --exclude-standard & git diff --stat --name-only;} | cat | head -n 1 | pbcopy"
alias done="{ git ls-files -o --exclude-standard & git diff --stat --name-only;} | cat | head -n 1 | xargs git add"

# The 'ls' family (this assumes you use the GNU ls)
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'		# sort by change time
alias lu='ls -lur'		# sort by access time
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lm='ls -al |more'         # pipe through 'more'
alias tree='tree -Csu'		# nice alternative to 'ls'
fpath+=${ZDOTDIR:-~}/.zsh_functions
