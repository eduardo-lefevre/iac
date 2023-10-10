# IaC

Repositório destinado a estudos sobre infraestrutura como código

## Terraform

[SonarQube Provider](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/sonarqube_github_binding)

Para importar recursos existentes e gerando o código:
`terraform plan -var-file=sq-community-localhost-admin.tfvars -generate-config-out=./generated_$(date +%Y%m%d%H%M%S)_$RANDOM.tf`

Para aplicar o plano sem o prompt de confirmação
`terraform apply -var-file=sq-community-localhost-admin.tfvars -auto-approve`
