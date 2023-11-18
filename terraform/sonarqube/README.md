# README.md

## SAML Properties

| PROPERTY KEY                           | Fake Values                                                            |
| -------------------------------------- | ---------------------------------------------------------------------- |
| sonar.auth.saml.applicationId          | sonarqube-okta                                                         |
| sonar.auth.saml.certificate.secured    | IdP Invalid Certificate                                                |
| sonar.auth.saml.enabled                | true                                                                   |
| sonar.auth.saml.loginUrl               | https://fake.okta.com/app/sonarqube_1/invalid/sso/saml                 |
| sonar.auth.saml.providerId             | http://www.okta.com/fake                                               |
| sonar.auth.saml.providerName           | SAML-FAKE                                                              |
| sonar.auth.saml.signature.enabled      | true                                                                   |
| sonar.auth.saml.sp.certificate.secured | Invalid SP Certificate                                                 |
| sonar.auth.saml.sp.privateKey.secured  | Invalid SP Private Key                                                 |
| sonar.auth.saml.user.email             | email                                                                  |
| sonar.auth.saml.user.login             | login                                                                  |
| sonar.auth.saml.user.name              | name                                                                   |

## Import order
01 - groups
02 - group_users
03 - global_permissions
04 - quality_profiles
05 - quality_gates
06 - projects
07 - project_permissions
08 - portfolios
