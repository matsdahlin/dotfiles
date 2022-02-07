
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
#

# ------
# -- Starship.rs
# ------------
eval "$(starship init zsh)"

# ------
# -- Language
# ------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ------
# -- Aliases
# ------------
alias ll="ls -al"
alias gc="git commit"
alias gs="git status"
