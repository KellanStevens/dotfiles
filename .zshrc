[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh

export STARSHIP_CONFIG=~/.config/starship.toml

eval "$(starship init zsh)"

SPACESHIP_PROMPT_ASYNC=FALSEexport PATH="/usr/local/sbin:$PATH