slimline::section::k8s_namespace::precmd() {
  unset slimline_section_k8s_namespace_output
}

slimline::section::k8s_namespace::async_task() {
  kubectl config view --minify --output 'jsonpath={..namespace}'
}

slimline::section::k8s_namespace::async_task_complete() {
  slimline_section_k8s_namespace_output=$2
}

slimline::section::k8s_namespace::render() {
  [[ -z "${slimline_section_k8s_namespace_output}" ]] && return

  slimline::utils::expand "k8s_namespace" "(%F{blue}|output|%f)" \
    "output" "${slimline_section_k8s_namespace_output}"
}
