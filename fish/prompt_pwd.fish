function prompt_pwd
  pwd | sed "s|$HOME|~|"
end
