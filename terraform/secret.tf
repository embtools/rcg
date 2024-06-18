data "github_repository" "repo" {
  full_name = var.github_repo
}

resource "github_repository_environment" "repo_environment" {
  repository  = data.github_repository.repo.name
  environment = terraform.workspace
}

resource "github_actions_environment_secret" "docker_hub_username" {
  repository      = data.github_repository.repo.name
  environment     = github_repository_environment.repo_environment.environment
  secret_name     = upper(var.github_docker_hub_username_secret)
  plaintext_value = var.docker_hub_username
}

resource "github_actions_environment_secret" "docker_hub_token" {
  repository      = data.github_repository.repo.name
  environment     = github_repository_environment.repo_environment.environment
  secret_name     = upper(var.github_docker_hub_token_secret)
  plaintext_value = var.docker_hub_token
}


output "github_environment" {
  value = github_repository_environment.repo_environment.environment
}
output "github_docker_hub_username_secret" {
  value = github_actions_environment_secret.docker_hub_username.secret_name
}
output "github_docker_hub_token_secret" {
  value = github_actions_environment_secret.docker_hub_token.secret_name
}

