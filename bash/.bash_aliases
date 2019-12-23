## ---------------------------------------------- general
alias grep="grep -n --color"
alias rm="rm -i"

## ---------------------------------------------- utility
alias p="ping 8.8.8.8"
alias pdf="evince"
alias ascii="graph-easy --from=dot --as_ascii"
alias cat="bat"
alias f="fdfind"
alias rmc="rm -rf CMakeFiles/ Testing/ CMakeCache.txt *.cmake Makefile compile_commands.json *.cbp"
alias u="sudo apt update && sudo apt upgrade"

## ---------------------------------------------- python
alias a="source ./venv/bin/activate"
alias d="deactivate"

## ---------------------------------------------- db
alias psql="pgcli"

## ---------------------------------------------- editor
alias v="vim.tiny"
alias ee="emacs -nw"
alias e="emacs -nw ."
alias s="subl"
export EDITOR="emacs -nw -q"

## ---------------------------------------------- tmux
alias t="pwd | rev | cut -f1 -d '/' | rev | xargs tmux new-session -d -s && tmux attach"
alias tl="tmux ls"
alias ta="tmux attach"
alias oss="tmuxp load oss"

## ---------------------------------------------- proxy
alias x='export http_proxy="http://127.0.0.1:8118"'
alias dx='export http_proxy=""'
alias whereiam='echo $(curl -s http://ip-api.com/json | jq -r ".country,.city")'

## ---------------------------------------------- calendar
alias c="gcalcli"
alias today="c agenda --calendar=morteza '`date --date=\"today\" +\"%a %b %d\"`' '`date --date=\"tomorrow\" +\"%a %b %d\"`'"
alias next="gcalcli agenda --military --nostarted --calendar=morteza '`date --date="today" +"%a %b %d"`' '`date --date="tomorrow" +"%a %b %d"`' | cut -d ' ' -f 2- | head -2 | tail -1 | sed -e 's/^[[:space:]]*//'"
alias week="c calw --calendar=morteza"
alias month="c calm --calendar=morteza"

## ---------------------------------------------- server
alias acc="kubectl config use-context plotwise-acc-accept-cluster"
alias dcc="kubectl config use-context minikube"
