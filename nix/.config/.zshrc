[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/keybindings.zsh ]] && source ~/.config/zsh/keybindings.zsh

eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/php@8.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/php@8.1/include"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export PATH="/Users/kellan/stack/.bin:$PATH"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

