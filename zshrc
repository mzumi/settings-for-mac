# path
export PATH="$HOME/bin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# editor
export EDITOR=vim

# rbenv
eval "$(rbenv init -)"

# rust
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# golang
export GOPATH=$HOME/Dev
export PATH="$HOME/.goenv/bin:$GOPATH/bin:$PATH"
eval "$(goenv init -)"

# python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# direnv
eval "$(direnv hook zsh)"

# alias
alias o='open'
alias gcd='cd $(ghq list -p | fzf)'
alias b='bat'
alias ls='lsd'

alias k='kubectl'
alias kg='kubectl get'
alias kgdep='kubectl get deployment'
alias ksys='kubectl --namespace=kube-system'
alias kd='kubectl describe'

# emacs key bind
bindkey -e

# ls color
autoload -U compinit
compinit

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=1000000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

# 全コマンドで correct 機能を無効化
unsetopt correctall

#補完でカラーを使用する
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#
# zplug
#
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

# Load theme file
zplug mafredri/zsh-async, from:github
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose > /dev/null
