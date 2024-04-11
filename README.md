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

### Server 배포하기

```tf
cd ./infra/server

terraform init
terraform validate
terraform apply -var="profile=monthly-cs" -var="domain_name=<가비아에서 구매한 도메인 이름>"
terraform destroy -var="profile=monthly-cs" -var="domain_name=<가비아에서 구매한 도메인 이름>"

예)
terraform apply -var="profile=monthly-cs" -var="domain_name=unchaptered.shop"
```