alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"
alias la="eza --icons --group-directories-first -la"

alias grep='grep --color'
alias cat='bat'

alias brwup='brew update -v && brew upgrade -v -g'

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias pest='./vendor/bin/pest'
alias sniff='vendor/bin/phpcs --standard=PSR12 app'
alias pa='php artisan'

alias tldu='tl dev up'
alias tldn='tl dev up --run-prune'

alias vim='nvim'
alias android_emu='emulator -avd Pixel_6_Pro_API_35_rootable_ -writable-system -no-snapshot-load'

alias rebuild-nix='darwin-rebuild switch --flake ~/.config/nix'

alias lgit='lazygit'
alias pa='php artisan' 
