alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"
alias la="eza --icons --group-directories-first -la"

alias grep='grep --color'

alias killphp='lsof -i:3000 | awk "NR!=1 {print $2}" | xargs kill -9'

alias brwup='brew upgrade -v && brew upgrade -v -g'

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

alias pest='./vendor/bin/pest'

alias sniff='vendor/bin/phpcs --standard=PSR12 app'

alias pa='php artisan'
