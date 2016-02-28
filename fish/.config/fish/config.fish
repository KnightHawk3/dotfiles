# Get profile stuff
env -i HOME=$HOME dash -l -c 'export -p' | sed -e "/PATH/s/'//g;/PATH/s/:/ /g;s/=/ /;s/^export/set -x/" | source

setenv GOPATH $HOME/Code/Go
setenv EDITOR nvim
setenv VISUAL nvim
# This must come BEFORE virtualfish etc, for minimal lag in window resizing...
# Basically resizing a window would cause lag because it would spawn a pytohn process 60 times a second.
# Bad idea.
setenv SXHKD_SHELL /usr/bin/dash

# Get these out of the way.
source ~/.config/fish/ssh_agent.fish
eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')
eval (python -m virtualfish)


set PATH ~/.bin $PATH
set PATH ~/.cabal/bin $PATH
