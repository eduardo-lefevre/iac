import {
  id = "AYvex3l0uG_UBzLIfuI-"
  to = sonarqube_qualityprofile.sonar_way___copied_abap
}


import {
  id = "AYveyNr3uG_UBzLIfuJB"
  to = sonarqube_qualityprofile.sonar_way___extended_abap
}


import {
  id = "AYvezvHJuG_UBzLIfuMY"
  to = sonarqube_qualityprofile.my_way_apex
}


import {
  id = "AYve6JuwuG_UBzLIfuOd"
  to = sonarqube_qualityprofile.my_way_terraform
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "AYvex3l0uG_UBzLIfuI-"
resource "sonarqube_qualityprofile" "sonar_way___copied_abap" {
  is_default = false
  language   = "abap"
  name       = "Sonar way - Copied"
  parent     = null
}

# __generated__ by Terraform from "AYve6JuwuG_UBzLIfuOd"
resource "sonarqube_qualityprofile" "my_way_terraform" {
  is_default = false
  language   = "terraform"
  name       = "My way"
  parent     = null
}

# __generated__ by Terraform from "AYvezvHJuG_UBzLIfuMY"
resource "sonarqube_qualityprofile" "my_way_apex" {
  is_default = false
  language   = "apex"
  name       = "My way"
  parent     = null
}

# __generated__ by Terraform from "AYveyNr3uG_UBzLIfuJB"
resource "sonarqube_qualityprofile" "sonar_way___extended_abap" {
  is_default = false
  language   = "abap"
  name       = "Sonar way - Extended"
  parent     = null
}
