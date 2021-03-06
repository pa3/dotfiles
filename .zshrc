# english only, please
export LC_ALL=en_US.UTF-8

# PROMPT
export PROMPT='%F{8}%~>%f '

# git branch in prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='%F{yellow}'\$vcs_info_msg_0_'%f'
#PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR="emacs"

export SBCL_HOME=/usr/lib/sbcl/

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall

# StartX after login
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec ssh-agent startx
fi

# nvm
source /usr/share/nvm/init-nvm.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/fedor/google-cloud-sdk/path.zsh.inc' ]; then . '/home/fedor/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/fedor/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/fedor/google-cloud-sdk/completion.zsh.inc'; fi
