resource "sonarqube_setting" "saml_application_id" {
  key   = "sonar.auth.saml.applicationId"
  value = "sonarqube-okta"
}

# This does not work as of 06/08/2023
# https://github.com/jdamata/terraform-provider-sonarqube/issues/91
resource "sonarqube_setting" "saml_idp_certificate" {
  key   = "sonar.auth.saml.certificate.secured"
  value = "IdP Invalid Certificate"
}

resource "sonarqube_setting" "saml_enabled" {
  key   = "sonar.auth.saml.enabled"
  value = "true"
}

resource "sonarqube_setting" "saml_login_url" {
  key   = "sonar.auth.saml.loginUrl"
  value = "https://fake.okta.com/app/sonarqube_1/invalid/sso/saml"
}

resource "sonarqube_setting" "saml_provider_id" {
  key   = "sonar.auth.saml.providerId"
  value = "http://www.okta.com/fake"
}

resource "sonarqube_setting" "saml_provider_name" {
  key   = "sonar.auth.saml.providerName"
  value = "SAML-FAKE"
}

resource "sonarqube_setting" "saml_signature_enabled" {
  key   = "sonar.auth.saml.signature.enabled"
  value = "true"
}

resource "sonarqube_setting" "saml_sp_certificate" {
  key   = "sonar.auth.saml.sp.certificate.secured"
  value = "Invalid SP Certificate"
}

resource "sonarqube_setting" "saml_sp_private_key" {
  key   = "sonar.auth.saml.sp.privateKey.secured"
  value = "Invalid SP Private Key"
}

resource "sonarqube_setting" "saml_user_email" {
  key   = "sonar.auth.saml.user.email"
  value = "email"
}

resource "sonarqube_setting" "saml_user_login" {
  key   = "sonar.auth.saml.user.login"
  value = "login"
}

resource "sonarqube_setting" "saml_user_name" {
  key   = "sonar.auth.saml.user.name"
  value = "name"
}
