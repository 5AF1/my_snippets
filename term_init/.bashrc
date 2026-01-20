# >>> fzf initialization >>>
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# <<< fzf initialization <<<

### micro editor
export VISUAL=micro;
export EDITOR=micro;
export GIT_EDITOR=micro;

### oh my posh
export PATH=$PATH:/home/tuf/bin
# export PATH=$PATH:/root/.local/bin
eval "$(oh-my-posh init bash --config https://raw.githubusercontent.com/5AF1/my_snippets/main/my_simple_posh.json)"
### end of oh my posh

# >>> oh my posh >>>
# posh safi
# oh-my-posh init {shell} --config /home/safirur.rashid/.cache/oh-my-posh/themes/{theme}.omp.json

#export PATH=$PATH:/home/safirur.rashid/bin
# export PATH=$PATH:/root/.local/bin
#eval "$(oh-my-posh init bash --config https://raw.githubusercontent.com/5AF1/my_snippets/main/my_simple_posh.json)"

# Set default value if not already exported elsewhere
export POSH_OFF="true"

if [ "$POSH_OFF" = "true" ]; then
    export PATH=$PATH:/home/safirur.rashid/bin
    eval "$(oh-my-posh init bash --config https://raw.githubusercontent.com/5AF1/my_snippets/main/my_simple_posh.json)"
fi
# <<< oh my posh <<<

# cargo
. "$HOME/.cargo/env"

# >>> yazi helper function >>>
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
# <<< yazi helper function <<<

# >>> umask changed by safi >>>

# Set default permissions so my group can read/write new files.
# Default umask is 0022 → files: 666-022=644 
#   644 breakdown: owner rw-, group r--, others r--
# Change to 0002 → files: 666-002=664 
#   664 breakdown: owner rw-, group rw-, others r-
umask 0002

# <<< umask changed by safi <<<

# >>> zoxide safi >>>
eval "$(zoxide init bash)"
# <<< zoxide safi <<<

# >>> tmux keep safi >>>
export TMOUT=0
# <<< tmux keep safi <<<

# >>> safi aliases >>>

# Lock: remove write access from everyone
alias lock='chmod -R a-w'

# Unlock for me only (user)
alias unlock='chmod -R u+w'

# Unlock for me + group
alias unlockg='chmod -R ug+w'

# <<< safi aliases <<<


####################
### CONDA ##########
####################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
export CONDA_ENVS_DIRS=/opt/conda/anaconda3/envs
__conda_setup="$('/opt/conda/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/anaconda3/bin:$PATH"
    fi  
fi
unset __conda_setup
# <<< conda initialize <<<
