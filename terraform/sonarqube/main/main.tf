# Reference: https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs

terraform {
  required_providers {
    sonarqube = {
      source  = "jdamata/sonarqube"
      version = "0.16.6"
      #version = "~> 0.16.6"
    }
  }
}

# To change the values, pass them as environment variables, like this:
# export TF_VAR_sonarqube_token="access_token"
# export TF_VAR_sonarqube_host="http(s)://your_host(:port))"

provider "sonarqube" {
  token = var.sonarqube_token
  host  = var.sonarqube_url
}
