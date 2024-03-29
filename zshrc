# Welcome message!
#

export ZSH=~/.oh-my-zsh
export EDITOR="nvim"
export CHEF_REPO="~/src/chef-repo"

#SOBOLE_THEME_MODE=dark

#ZSH_THEME="maran"
#ZSH_THEME="afowler"
#ZSH_THEME="sunaku"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="gentoo"
#ZSH_THEME="agnoster"
#ZSH_THEME="zeta"
#ZSH_THEME="geometry/geometry"
#ZSH_THEME="lambda-pure"
#ZSH_THEME="honukai"

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git brew osx composer docker pip zsh-autosuggestions)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Users/ret/.gem/ruby/1.8/bin:/opt/nginx/sbin:$HOME/.cargo/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# Disable noisy zsh
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#load custom aliases
source ~/src/dotfiles/custom_aliases

# Custom keyboard bindings
bindkey -e
bindkey '^[^[[C' forward-word
bindkey '^[^[[D' backward-word

function iterm_title {
    echo -ne "\033]0;"$*"\007"
}

ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        tmux rename-window "$(echo $* | cut -d . -f1,2)"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        iterm_title "$(echo $* | cut -d . -f1,2)"
        command ssh "$@"
    fi
}

function gh() {
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi

  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git/\/tree/}
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
  giturl=$giturl/tree/$branch
  open $giturl
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$(hostname)" = "relvira-C02F71EAMD6R" ] || [ "$(hostname)" = "relvira-ltm64uf.internal.salesforce.com" ] || [ "$(hostname)" = "relvira-wsmbg2e.internal.salesforce.com" ]; then
  # Load SSH keys into agent forwarder
  ssh-add -K

  ## Aliases

  # Exported vars
  export GIT_VERSION='111111111.11111111.111111111'

  # Update prompt to show branch name
  PROMPT='%{$fg[green]%}%~%{$fg_bold[blue]%}$(parse_git_branch)%{$reset_color%} $ '

fi



#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
