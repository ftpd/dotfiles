function prompt_pwd
  pwd | sed -e 's|/private||' -e "s|$HOME|~|"
end
