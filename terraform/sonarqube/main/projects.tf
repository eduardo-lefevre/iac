import {
  id = "org.sonarqube:sonarscanner-maven-basic"
  to = sonarqube_project.example_of_basic_maven_project
}

import {
  id = "org.sonarqube:sonarscanner-maven-basic"
  to = sonarqube_project_main_branch.example_of_basic_maven_project_master
}

# Project 'Example of basic Maven project (org.sonarqube:sonarscanner-maven-basic)' does not have a valid ALM configuration!
import {
  id = "Test QP/org.sonarqube:sonarscanner-maven-basic/java"
  to = sonarqube_qualityprofile_project_association.example_of_basic_maven_project_test_qp_java
}
