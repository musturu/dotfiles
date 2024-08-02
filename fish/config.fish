# Fish shell configuration file
fish_default_key_bindings
# Set the default editor
set -gx EDITOR nvim


# Custom aliases
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gp='git push'
alias gc='git commit'
alias vim='nvim'
# Custom functions

# Create a directory and change to it
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

# Quick find function
function f
    find . -name "*$argv[1]*"
end

# Set custom prompt
function fish_prompt
    set_color red
    echo -n '┬── '
    set_color yellow
    echo -n $USER
    set_color normal
    echo -n ' at '
    echo -n $hostname
    echo -n ' in '
    set_color purple
    echo -n (prompt_pwd)/
    set_color red
    echo -n " ──[$(date +"%H:%M:%S %6N ms")]"
    set_color red
	echo -n \n
    echo -n '╰─❯' 
    set_color normal
end

# Enable autosuggestions (if not enabled by default)
set -g fish_autosuggestion_enabled 1

# Set color scheme
set -g fish_color_command blue
set -g fish_color_param cyan
set -g fish_color_error red
set -g fish_color_normal normal

# Add custom paths
set -gx PATH $HOME/bin $PATH

# Load environment variables from a separate file
if test -f $HOME/.fish_env
    source $HOME/.fish_env
end

# Enable syntax highlighting (if not enabled by default)
set -g fish_color_autosuggestion 555

# Set default greeting
set -g fish_greeting "les go"

# Use a custom function for directory listing
function l
    ls -lah $argv | awk '
    {
      k=0;
      for (i=0;i<=8;i++)
        k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));
      if (k)
        printf("%0o ",k);
      print;
    }'
end

# Load any local configurations
if test -f $HOME/.config/fish/local.fish
    source $HOME/.config/fish/local.fish
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
