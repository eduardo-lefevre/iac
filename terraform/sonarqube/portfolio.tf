resource "sonarqube_portfolio" "lefevre" {
  key            = "lefevre"
  name           = "Lefèvre"
  description    = "Lefèvre's Portfolio"
  selection_mode = "TAGS"
  tags           = ["team-lefevre"]
}
