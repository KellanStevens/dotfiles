[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh

export EDITOR=nvim

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export PATH="/Users/kellan/stack/.bin:$PATH"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

case "$TERM_PROGRAM" in (WarpTerminal|iTerm.app|Apple_Terminal)
  fastfetch ;;
esac

bindkey -e

bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

if [ "$TMUX" = "" ]; then tmux; fi
