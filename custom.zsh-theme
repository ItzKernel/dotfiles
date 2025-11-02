# custom.zsh-theme
#
# Author: me :3

PS1="${FG[141]}%~\$(git_prompt_info) ${FG[141]}%(!.#.󰋑)%{$reset_color%} "
# PS2="%{$fg[red]%}\ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[135]}(${FG[099]}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[161]}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[135]})%{$reset_color%}"
