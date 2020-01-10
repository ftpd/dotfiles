slimline::section::k8s_context::precmd() {
  unset slimline_section_k8s_context_output
}

slimline::section::k8s_context::async_task() {
  kubectl config current-context
  # gsed -nr '/current-context/s/(.*) (.*)/\2/p' ~/.kube/config
}

slimline::section::k8s_context::async_task_complete() {
  slimline_section_k8s_context_output=$2
}

slimline::section::k8s_context::render() {
  [[ -z "${slimline_section_k8s_context_output}" ]] && return

  slimline::utils::expand "k8s_context" "[☸️  %F{blue}|output|%f]" \
      "output" "${slimline_section_k8s_context_output}" \
}
