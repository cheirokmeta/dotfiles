# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# $PATH Settings
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/libressl/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/Users/user/.userbin:$PATH"
export PATH="/opt/filebeat:$PATH"
export PATH="/opt/sherlock:$PATH"
# oh-my-zsh path
export ZSH="/Users/user/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Display red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    ansible
    jsontools
    aws
    iterm2
    textastic
    osx
)

# User configuration

bindkey " " magic-space

# Language environment
export LANG=en_US.UTF-8

# Preferred editor
EDITOR='vim'

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HIST_STAMPS="%OF %OX %-*"

# Setopt options
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt auto_list
setopt auto_menu
setopt always_to_end

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases
alias neofetch="/opt/homebrew/bin/neofetch"
alias omac='eval $(op signin mac)'
alias eye='eyeD3'

smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source $ZSH/oh-my-zsh.sh

eval "$(op completion zsh)"; compdef _op op

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

