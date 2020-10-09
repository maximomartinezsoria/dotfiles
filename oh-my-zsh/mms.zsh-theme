PROMPT="%(?:%{$fg_bold[cyan]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+='%{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)'

RPROMPT="%{$fg[magenta]%}%t "
RPROMPT+='%(?.%{$fg[green]%}✔.%{$fg[red]%}✘%f)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}\ue0a0 %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[red]%}✗"
