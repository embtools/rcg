variable "docker_token" {
  type      = string
  sensitive = true
}
variable "docker_username" {
  type      = string
}

variable "docker_registry" {
  type = string
  default = null
}


variable "github_docker_token_secret" {
  type    = string
  default = "DOCKER_TOKEN"
}


variable "github_docker_registry_variable" {
  type    = string
  default = "DOCKER_REGISTRY"
}
variable "github_docker_username_variable" {
  type    = string
  default = "DOCKER_USERNAME"
}



variable "github_repo" {
}
