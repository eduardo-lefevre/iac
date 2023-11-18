import {
  id = "My way"
  to = sonarqube_qualitygate.my_way_quality_gate
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "My way"
resource "sonarqube_qualitygate" "my_way_quality_gate" {
  copy_from  = null
  is_default = false
  name       = "My way"
  condition {
    metric    = "new_coverage"
    op        = "LT"
    threshold = "80"
  }
  condition {
    metric    = "new_duplicated_lines_density"
    op        = "GT"
    threshold = "3"
  }
  condition {
    metric    = "new_maintainability_rating"
    op        = "GT"
    threshold = "1"
  }
  condition {
    metric    = "new_reliability_rating"
    op        = "GT"
    threshold = "1"
  }
  condition {
    metric    = "new_security_hotspots_reviewed"
    op        = "LT"
    threshold = "100"
  }
  condition {
    metric    = "new_security_rating"
    op        = "GT"
    threshold = "1"
  }
}
