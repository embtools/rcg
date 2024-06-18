data "github_repository" "repo" {
  full_name = var.github_repo
}

resource "github_actions_secret" "docker_token" {
  repository      = data.github_repository.repo.name
  secret_name     = upper(var.github_docker_token_secret)
  plaintext_value = var.docker_token
}
resource "github_actions_variable" "docker_registry" {
  repository      = data.github_repository.repo.name
  variable_name     = upper(var.github_docker_registry_variable)
  value = coalesce(var.docker_registry, "docker.io/${var.docker_username}")
}
resource "github_actions_variable" "docker_username" {
  repository      = data.github_repository.repo.name
  variable_name     = upper(var.github_docker_username_variable)
  value = var.docker_username
}


output "github_docker_token_secret" {
  value = github_actions_secret.docker_token.secret_name
}

output "github_docker_registry_variable" {
  value = github_actions_variable.docker_registry.variable_name
}

output "github_docker_username_variable" {
  value = github_actions_variable.docker_username.variable_name
}


