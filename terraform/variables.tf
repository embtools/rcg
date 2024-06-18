variable "docker_hub_token" {
  type      = string
  sensitive = true
}
variable "docker_hub_username" {
  type      = string
  sensitive = true
}



variable "github_docker_hub_token_secret" {
  type    = string
  default = "DOCKER_HUB_TOKEN"
}


variable "github_docker_hub_username_secret" {
  type    = string
  default = "DOCKER_HUB_SECRET"
}


variable "github_repo" {
}
