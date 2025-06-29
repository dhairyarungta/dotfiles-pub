# Add alias missing on Debian
cat >> ~/.bashrc << 'EOF'
case $- in
  *i*) ;;
    *) return;;
esac
set -o ignoreeof
source /usr/share/doc/fzf/examples/key-bindings.bash
set show-mode-in-prompt on
alias vim='nvim'
alias cl='clear'

#alias g++='g++-14 -std=c++23'
#alias gcc='gcc-14'

#oh-my-bash automatically adds these aliases
# ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'
# alias lt='ls -altr'  # Sort by time, newest last
# alias lh='ls -alh'   # Human readable sizes
# alias lS='ls -alS'   # Sort by size, largest first


if [ -z "$TMUX" ]; then
    if tmux has-session 2>/dev/null; then
        tmux attach-session
    else
        tmux new-session
    fi
fi

#git aliases 
git config --global alias.ci commit
git config --global alias.chk checkout
git config --global alias.s status

set -o vi
set editing-mode vi
EOF
