# .bashrc
export OPENTOKKEY="45440362"
export OPENTOKSECRET="0be3613404311511a59802ce41aca2c228c15165"
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

force_color_prompt=yes

alias git_log_color="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias wolfram="wolfram.rb"
alias ciphertool="python ~/Documents/Python/cipher_project/vignere.py"
alias public_ip="~/bin/shell_scripts/public_ip.sh"
alias private_ip="hostname -I"
alias backup="~/bin/shell_scripts/backup.sh"
alias cava="javac -d ../bin "
alias run="java -cp ../bin "
alias cmuvpn="/opt/cisco/anyconnect/bin/vpnui"
alias pdfocr="ruby ~/bin/pdfocr.rb"
alias psh='ssh -o"ProxyCommand ssh -qaxT doc.law.harvard.edu nc %h %p"'
alias afs='ssh -t rbrigden@unix4.andrew.cmu.edu "cd ~/private/ ; bash"'
alias shark='ssh -t rbrigden@baskingshark.ics.cs.cmu.edu "cd ~/private/18213 ; bash"'
alias sailfish='ssh -t sailfish@sailfish.ece.cmu.edu "cd ~/sailfish ; bash"'

#Custm PSI
export PS1="\[\e[00;35m\]\u\[\e[0m\]\[\e[00;32m\]@\[\e[0m\]\[\e[00;33m\]\h\[\e[0m\]\[\e[00;37m\]{\W}\n$ \[\e[0m\]"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$GOPATH/bin"
export GOPATH="$HOME/gocode"


# for creating symlinks to jump between directories
export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

#add textcomplete for jumping
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
export PATH=$PATH:~/.c0/bin
export PATH=$PATH:~/.c0/bin
