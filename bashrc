if [ "$1" != "from_zshrc" ]; then
  # .zshrcから読み込まれた場合はここをスキップする
  . /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
  #export PS1="\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[1;30m\]\$(__git_ps1)\[\e[0m\]\n\$ "
  export PS1="\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[1;30m\]\$(__git_ps1)\n\[\e[3$((RANDOM%9))m\]\]>\[\e[3$((RANDOM%9))m\]\]>\[\e[3$((RANDOM%9))m\]\]>\[\e[0m\] "

  # completion script for bash
  . /usr/local/Cellar/bash-completion/1.3/etc/bash_completion
  . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
else
  # .zshrcから読み込まれた場合はここを実行する
  :
fi

# シェルをviモードに
set -o vi

# PATH
export PATH=$HOME/.cabal/bin:/usr/local/bin:/usr/local/development/bin:$PATH
export PATH=$PATH:/usr/local/Cellar/mysql/5.6.23/bin
export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql/5.6.23/lib:$DYLD_LIBRARY_PATH

# alias
alias ls='ls -FG'  #G=colorize
alias ll='ls -la'
alias llh='ls -lah'
alias rm='rm -i'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias vag='vagrant'
alias vis="vim -S ~/Session.vim"
alias gimdiff='git difftool --tool=vimdiff --no-prompt'

# enable Ctrl-S at bash.
stty stop undef

# 連続して実行された同じコマンドをhistoryに残さない
export HISTCONTROL=ignoreboth

# 拡張find
alias xfind='find . -type f | xargs grep'

# Elastic Beanstalk
export PATH=/usr/local/aws/eb/macosx/python2.7/:$PATH
export AWS_CREDENTIAL_FILE="~/.elasticbeanstalk/aws_credential_file"

# rbenv
export PATH=~/.rbenv/shims:$PATH

# tmux
alias tmux="TERM=screen-256color-bce tmux"
