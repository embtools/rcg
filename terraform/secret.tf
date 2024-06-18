data "github_repository" "repo" {
  full_name = var.github_repo
}

resource "github_actions_secret" "docker_hub_token" {
  repository      = data.github_repository.repo.name
  secret_name     = upper(var.github_docker_hub_token_secret)
  plaintext_value = var.docker_hub_token
}
resource "github_actions_secret" "docker_hub_username" {
  repository      = data.github_repository.repo.name
  secret_name     = upper(var.github_docker_hub_username_secret)
  plaintext_value = var.docker_hub_username
}

output "github_docker_hub_token_secret" {
  value = github_actions_secret.docker_hub_token.secret_name
}

output "github_docker_hub_username_secret" {
  value = github_actions_secret.docker_hub_username.secret_name
}

