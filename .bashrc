# .bashrc
export BASH_CONF="bashrc"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

force_color_prompt=yes

# PROMPT
export PS1="\[\033[38;5;214m\]\u\[$(tput sgr0)\]\[\033[38;5;45m\]@\[$(tput sgr0)\]\[\033[38;5;215m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]{\[$(tput sgr0)\]\[\033[38;5;45m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]}\n\[$(tput sgr0)\]\[\033[38;5;206m\]>\[$(tput sgr0)\]\[\033[38;5;83m\]>\[$(tput sgr0)\]\[\033[38;5;39m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# GOLANG
export PATH="$PATH:$GOPATH/bin"
export GOPATH="$HOME/gocode"

# GIT
alias git_log_color="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# DIRECTORY HELPERS
alias l="ls -la"       # List in long format, include dotfiles
alias ld="ls -ld */"   # List in long format, only directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# MACOS HELPERS
# Recursively remove .DS_Store files
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

# EC2
ec2-status() {
  aws ec2 describe-instance-status --output=table
}

ec2-stop() {
  aws ec2 stop-instances --instance-ids="$1"
}

ec2-start() {
  aws ec2 start-instances --instance-ids="$1"
}

ec2-ssh() {
  ssh -i $AWS_KEY_PATH ubuntu@`ec2-hostname "$1"`
}
