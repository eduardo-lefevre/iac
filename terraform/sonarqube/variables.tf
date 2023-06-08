variable "sonarqube_url" {
  description = "SonarQube URL"
  default     = "http://localhost:9000"
}

variable "sonarqube_token" {
  description = "SonarQube access token"
}

variable "admin_password" {
  description = "SonarQube admin user password"
}
