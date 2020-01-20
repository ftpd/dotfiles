#git clone --recursive https://github.com/mengelbrecht/slimline.git ~/.zsh/themes/slimline
source ~/.dotfiles/zsh/slimline_k8s_ctx.zsh
source ~/.dotfiles/zsh/slimline_k8s_ns.zsh

SLIMLINE_RIGHT_PROMPT_SECTIONS=""
SLIMLINE_LEFT_PROMPT_SECTIONS="virtualenv aws_profile k8s_context k8s_namespace cwd git exit_status execution_time newline user_host_info symbol"
SLIMLINE_USER_HOST_INFO_FORMAT="%F{green}|user|%F{white}@%F{cyan}|host|%f"
SLIMLINE_USER_HOST_INFO_ROOT_FORMAT="%F{red}|user|%F{white}@%F{cyan}|host|%f"
SLIMLINE_VIRTUALENV_FORMAT="%F{cyan}\UE73C |basename|%f"
SLIMLINE_AWS_PROFILE_FORMAT="%F{yellow} \uF270 |profile|%f"
SLIMLINE_SYMBOL_WORKING_FORMAT="%F{red}➜%f"
SLIMLINE_SYMBOL_READY_FORMAT="%F{243}➜%f"
SLIMLINE_MAX_EXEC_TIME=2
source ~/.zsh/themes/slimline/slimline.zsh
