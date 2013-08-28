export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting