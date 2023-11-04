TOKEN=$1
URL=$2
SUFFIX=$3

# TOKEN: file://path/to/token-file
# URL: https://sonarqube.host

echo "Getting global permissions"
./generate-tf-imports.py global_permissions "${TOKEN}" "${URL}" > ${SUFFIX}-global-permissions.tf
echo "Getting groups"
./generate-tf-imports.py groups "${TOKEN}" "${URL}" > ${SUFFIX}-groups.tf
echo "Getting group users"
./generate-tf-imports.py group_users "${TOKEN}" "${URL}" > ${SUFFIX}-group-users.tf
echo "Getting project permissions"
./generate-tf-imports.py project_permissions "${TOKEN}" "${URL}" > ${SUFFIX}-project-permissions.tf
echo "Getting projects"
./generate-tf-imports.py projects "${TOKEN}" "${URL}" > ${SUFFIX}-projects.tf
echo "Getting portfolios"
./generate-tf-imports.py portfolios "${TOKEN}" "${URL}" > ${SUFFIX}-portfolios.tf
