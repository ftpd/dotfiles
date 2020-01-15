#git clone --recursive https://github.com/mengelbrecht/slimline.git ~/.zsh/themes/slimline
source ~/.dotfiles/zsh/slimline_k8s_ctx.zsh
source ~/.dotfiles/zsh/slimline_k8s_ns.zsh

SLIMLINE_LEFT_PROMPT_SECTIONS="user_host_info cwd symbol"
SLIMLINE_RIGHT_PROMPT_SECTIONS="exit_status execution_time git virtualenv aws_profile k8s_context k8s_namespace"
SLIMLINE_USER_HOST_INFO_FORMAT="%F{green}|user|%F{white}@%F{cyan}|host|%f"
SLIMLINE_USER_HOST_INFO_ROOT_FORMAT="%F{red}|user|%F{white}@%F{cyan}|host|%f"
SLIMLINE_VIRTUALENV_FORMAT="venv:%F{blue}|basename|%f"
SLIMLINE_AWS_PROFILE_FORMAT="aws:%F{blue}|profile|%f"
SLIMLINE_SYMBOL_WORKING_FORMAT="%F{red}➜%f"
SLIMLINE_SYMBOL_READY_FORMAT="%F{243}➜%f"
SLIMLINE_MAX_EXEC_TIME=2
source ~/.zsh/themes/slimline/slimline.zsh
