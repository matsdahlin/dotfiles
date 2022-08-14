# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
#

# ------
# -- NVM
# ------------
export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

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
alias vim=nvim

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
