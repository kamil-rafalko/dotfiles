# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zplug/init.zsh


zplug "plugins/common-aliases",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose >> /dev/null
EDITOR="nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls="ls --color"


alias bzltest=bzl_test_fn

function bzl_test_fn() {
 mbzl test --color=yes --curses=yes --test_summary=short $@ |& ~/src/misc/format_test_output --default
}

export GOROOT="/Users/kamilr/go/go1.23.12"
export PATH=$PATH:$GOROOT/bin

# Set GOPATH
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# Override with server's GOPATH
export GOPATH=$HOME/src/server/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/Users/kamilr/.nvm/versions/node/v20.13.1/bin:$PATH"
export PATH="/opt/homebrew/opt/go@1.23/bin:$PATH"

alias nvim="/opt/homebrew/opt/nvim/bin/nvim"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# include .bashrc_aliases if it exists
if [ -f $HOME/.additional_env_vars ]; then
    . $HOME/.additional_env_vars
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

