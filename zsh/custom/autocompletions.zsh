# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/mjorgensen/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# mc autocomplete setup
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc
