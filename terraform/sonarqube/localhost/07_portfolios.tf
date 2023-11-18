import {
  id = "lefevre"
  to = sonarqube_portfolio.lefevre
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "lefevre"
resource "sonarqube_portfolio" "lefevre" {
  branch         = null
  description    = "Lefèvre's Portfolio"
  key            = "lefevre"
  name           = "Lefèvre"
  regexp         = null
  selection_mode = "TAGS"
  tags           = ["team-lefevre"]
  visibility     = "public"
}
