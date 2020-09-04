# Welcome message!
#

export ZSH=~/.oh-my-zsh
export EDITOR="nvim"
export CHEF_REPO="~/src/chef-repo"

SOBOLE_THEME_MODE=dark

#ZSH_THEME="maran"
ZSH_THEME="afowler"
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

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#load custom aliases
source ~/.dotfiles/custom_aliases

# Custom keyboard bindings
bindkey -e
bindkey '^[^[[C' forward-word
bindkey '^[^[[D' backward-word

#export GOPATH="$(go env GOPATH)"


#Add ssh private key to ssh-agent
#ssh-add ~/.ssh/id_rsa > /dev/null

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

if [ "$(hostname)" = "DUB-M-RELVIRA01" ]; then
  # Load SSH keys into agent forwarder
  ssh-add -K

  ## Aliases

  # Cricket ops-beach
  alias beach="ssh z-ops-relvira-cricket.nebula.tinyspeck.com"

  # Beetle kube-beach
  alias kbeach="ssh z-kube-beach-relvira-beetle"

  # Exported vars
  export GIT_VERSION='111111111.11111111.111111111'


fi

