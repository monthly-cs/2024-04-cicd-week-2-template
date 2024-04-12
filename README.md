# 프론트앤드 CI/CD 2주차

## Get Started


### DNS 배포하기

```tf
cd ./infra/dns

terraform init
terraform validate
terraform apply -var="profile=monthly-cs" -var="domain_name=<가비아에서 구매한 도메인 이름>"
terraform destroy -var="profile=monthly-cs" -var="domain_name=<가비아에서 구매한 도메인 이름>"

예)
terraform apply -var="profile=monthly-cs" -var="domain_name=unchaptered.shop"
```

### AMI 배포하기

```tf
cd ./infra/ami

packer init .
packer validate .
packer build .
```

### Server 배포하기

```tf
cd ./infra/server

terraform init
terraform validate
terraform apply -var="profile=monthly-cs" -var="domain_name=<가비아에서 구매한 도메인 이름>" -var="ami_id=<Packer로 생성된 AMI ID>"
terraform destroy -var="profile=monthly-cs" -var="domain_name=<가비아에서 구매한 도메인 이름>" -var="ami_id=<Packer로 생성된 AMI ID>"

예)
terraform apply -var="profile=monthly-cs" -var="domain_name=unchaptered.shop" -var="ami_id=ami-0ba253c2f6060b6c7"
```

- Output 출력하기

```
# Windows
for /f %i in ('terraform output s3_name') do echo s3_name %i
for /f %i in ('terraform output codedeploy_app_name') do echo codedeploy_app_name %i
for /f %i in ('terraform output codedeploy_deployment_name') do echo codedeploy_deployment_name %i

# Mac
echo s3_name $(terraform output s3_name)
echo codedeploy_app_name $(terraform output codedeploy_app_name)
echo codedeploy_deployment_name $(terraform output codedeploy_deployment_name)
```