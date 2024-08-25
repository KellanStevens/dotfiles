[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh

export STARSHIP_CONFIG=~/.config/starship.toml
export EDITOR=vim

eval "$(starship init zsh)"

SPACESHIP_PROMPT_ASYNC=FALSEexport PATH="/usr/local/sbin:$PATH"

export PATH="/Users/kellan/stack/.bin:$PATH"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

case "$TERM_PROGRAM" in
  WarpTerminal|iTerm.app|Apple_Terminal) fastfetch ;;
esac

bindkey -e

bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
