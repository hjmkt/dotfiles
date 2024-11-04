# Totally ripped off Dallas theme

# Grab the current date (%W) and time (%t):
#JUNKFOOD_TIME_="┌─%{$fg_bold[red]%}#%{$fg_bold[white]%}( %{$fg_bold[yellow]%}%W%{$reset_color%}@%{$fg_bold[white]%}%t )( %{$reset_color%}"

# YYYY-MM-DD HH:MM:SS
JUNKFOOD_TIME_="┌─%{$fg_bold[red]%}#%{$fg_bold[white]%}( %{$fg_bold[yellow]%}%D{%Y-%m-%d}%{$reset_color%} %{$fg_bold[yellow]%}%T%{$reset_color%} )( %{$reset_color%}"

# Grab the current machine name
JUNKFOOD_MACHINE_="%{$fg_bold[blue]%}%m%{$fg[white]%} ):%{$reset_color%}"

# Grab the current username
JUNKFOOD_CURRENT_USER_="%{$fg_bold[green]%}%n%{$reset_color%}"
#JUNKFOOD_CURRENT_USER_="%{%B%F{#8ec07c}%n%{$reset_color%}"

# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository: ~aw@master
JUNKFOOD_LOCA_="%{$fg[cyan]%}%~%{$reset_color%}@%{$fg[red]%}\$(git_current_branch)%{$reset_color%}"
#JUNKFOOD_LOCA_="%{$fg[cyan]%}%~%{$reset_color%}@%{%F{#cc241d}%}\$(git_current_branch)%{$reset_color%}"

# For the git prompt, use a white @ and blue text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}@%{$fg_bold[white]%}"

# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

# Add 3 cyan ✗s if this branch is diiirrrty! Dirty branch!
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗✗✗"




PROMPT_1="$JUNKFOOD_TIME_$JUNKFOOD_CURRENT_USER_@$JUNKFOOD_MACHINE_$JUNKFOOD_LOCA_"

fill_right_with_dashes() {
  local evaluated_prompt=$(echo "$1")
  evaluated_prompt=$(print -P "$evaluated_prompt")
  local prompt_length=$(echo -n "$evaluated_prompt" | sed -r "s/\x1B\[[0-9;]*[mK]//g" | wc -m)
  prompt_length=$((prompt_length + 1))

  local term_width=$(tput cols)
  local dash_count=$((term_width - prompt_length))
  if (( dash_count > 0 )); then
    printf '─%.0s' $(seq 1 $dash_count)
  fi
}

precmd() {
  PROMPT_2=$(fill_right_with_dashes "$PROMPT_1")
  PROMPT="${PROMPT_1} ${PROMPT_2}
%{$fg_bold[white]%}└─%{$fg_bold[red]%}%% %{$reset_color%}"
}

