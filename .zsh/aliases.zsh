alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"
alias la="eza --icons --group-directories-first -la"

alias grep='grep --color'

alias killphp='lsof -i:3000 | awk "NR!=1 {print $2}" | xargs kill -9'

alias brwup='brew upgrade -v && brew upgrade -v -g'

alias kas-dev='ssh kas-dev.t100.uk'
alias blm-dev='ssh blm-dev.t100.uk'

alias apits-test='ssh apits-test.t100.uk'
alias apits-live='ssh apits-live.t100.uk'

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

alias pa='php artisan'
