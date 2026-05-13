# Go.
set -x GOPRIVATE "gitlab.ci.fdmg.org/*"

# Database.
set -x MYCLI_HISTFILE "$HOME/.config/mycli/history"

# Aliases.
alias vpn "sudo cato-sdp start --append=tail --route 10.0.0.0/8 --reconn 5 --headless"
