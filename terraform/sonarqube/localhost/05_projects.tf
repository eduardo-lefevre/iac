################################################################
## Project: Go (org.elefevre:go)
################################################################

import {
  id = "org.elefevre:go"
  to = sonarqube_project.go
}

import {
  id = "org.elefevre:go/main"
  to = sonarqube_project_main_branch.go_main
}

import {
  id = "org.elefevre:go/32044637"
  to = sonarqube_gitlab_binding.go_gitlab
}


################################################################
## Project: IaC Projects (org.elefevre:iac)
################################################################

import {
  id = "org.elefevre:iac"
  to = sonarqube_project.iac_projects
}

import {
  id = "org.elefevre:iac/main"
  to = sonarqube_project_main_branch.iac_projects_main
}

# Project 'IaC Projects (org.elefevre:iac)' does not have a valid ALM configuration!
import {
  id = "My way/org.elefevre:iac/terraform"
  to = sonarqube_qualityprofile_project_association.iac_projects_my_way_terraform
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "org.elefevre:go"
resource "sonarqube_project" "go" {
  name       = "Go"
  project    = "org.elefevre:go"
  tags       = ["team-lefevre"]
  visibility = "private"
}

# __generated__ by Terraform from "org.elefevre:go/32044637"
resource "sonarqube_gitlab_binding" "go_gitlab" {
  alm_setting = "gitlab"
  monorepo    = "false"
  project     = "org.elefevre:go"
  repository  = "32044637"
}

# __generated__ by Terraform from "org.elefevre:iac"
resource "sonarqube_project" "iac_projects" {
  name       = "IaC Projects"
  project    = "org.elefevre:iac"
  tags       = ["team-lefevre"]
  visibility = "public"
}

# __generated__ by Terraform from "org.elefevre:iac/main"
resource "sonarqube_project_main_branch" "iac_projects_main" {
  name    = "main"
  project = "org.elefevre:iac"
}

# __generated__ by Terraform from "org.elefevre:go/main"
resource "sonarqube_project_main_branch" "go_main" {
  name    = "main"
  project = "org.elefevre:go"
}

# __generated__ by Terraform from "My way/org.elefevre:iac/terraform"
resource "sonarqube_qualityprofile_project_association" "iac_projects_my_way_terraform" {
  language        = "terraform"
  project         = "org.elefevre:iac"
  quality_profile = "My way"
}
