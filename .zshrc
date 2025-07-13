################## zinit ##################
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

################# plugins ##################

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/history-search-multi-word

################## basic ###################

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000

setopt share_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt extended_history
setopt hist_expire_dups_first

zshaddhistory() {
    [[ "$?" == 0 ]]
}

# stash line once
bindkey '^O' push-line

# edit command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^[," edit-command-line

############### completion ################

autoload -Uz compinit; compinit
autoload -Uz colors; colors

zstyle ':completion:*:default' menu select=2           # Completion by TAB key
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'    # Match uppercase letters in completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  # Colorize file completion
setopt auto_param_slash                                # Auto-append "/" to directory names for seamless completion
setopt auto_param_keys                                 # Auto-complete brackets
setopt mark_dirs                                       # Append "/" to directories in filename expansion
setopt auto_menu                                       # Cycle through completion candidates on repeated key press
setopt correct                                         # Auto-correct spelling mistakes
setopt interactive_comments                            # Treat text after "#" as a comment in the command line
setopt magic_equal_subst                               # Enable completion after "=" in command-line arguments like "--prefix=/usr"
setopt complete_in_word                                # Complete at cursor position, even in the middle of a word
setopt print_eight_bit                                 # Enable display of Japanese filenames
setopt no_beep

# Filter commands from history after partially typing
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

############### alias ################

# alias -g C='| pbcopy'  # macOS only
alias la='ls -lAG'
alias ll='ls -1 --color=auto'
alias ...='cd ../../'
alias ....='cd ../../../'
alias dots="cd ~/dotfiles"

################ fzf #################

# You should install fzf
# Github: `https://github.com/junegunn/fzf?tab=readme-ov-file#installation`
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout reverse --border"
source ~/dotfiles/fzf/key-bindings.zsh
function fd() {
    local dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

