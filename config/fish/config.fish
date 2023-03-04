if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

fish_add_path /home/itzkernel/.local/bin

function fish_prompt
    printf '%s%s %s->%s ' (set_color black) (prompt_pwd) (set_color magenta) (set_color normal)
end

