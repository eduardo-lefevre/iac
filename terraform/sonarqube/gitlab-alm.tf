variable "gitlab_alm_token" {
  description = "GitLab ALM Personal Access Token"
}

resource "sonarqube_alm_gitlab" "gitlab-alm" {
  key                    = "gitlab"
  url                    = "https://gitlab.com/api/v4"
  personal_access_token  = var.gitlab_alm_token
}
