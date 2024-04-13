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
packer build . > packer.log
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
terraform destroy -var="profile=monthly-cs" -var="domain_name=unchaptered.shop" -var="ami_id=ami-0ba253c2f6060b6c7"
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

## Local 환경에서 배포하기

### Server 압축하기

- Windows

```cmd
zip -r next-server.zip          ^
        ./.next                 ^
        ./component             ^
        ./public                ^
        ./scripts               ^
        ./src                   ^
        ./appspec.yml           ^
        ./ecosystem.config.json ^
        ./next-env.d.ts         ^
        ./next.config.mjs       ^
        ./package-lock.json     ^
        ./package.json          ^
        ./README.md             ^
        ./tsconfig.json         ^
        ./yarn.lock
```

- MacOS, Linux

```
zip -r next-server.zip          \
        ./.next                 \
        ./component             \
        ./public                \
        ./scripts               \
        ./src                   \
        ./appspec.yml           \
        ./ecosystem.config.json \
        ./next-env.d.ts         \
        ./next.config.mjs       \
        ./package-lock.json     \
        ./package.json          \
        ./README.md             \
        ./tsconfig.json         \
        ./yarn.lock
```

### Server S3에 업로드하기

```cmd
cd ./infra/server

terraform output s3_name
```

- Windows

```cmd
aws s3 cp                           ^
    --region us-east-1              ^
    ../../next-server.zip           ^
    s3://<terraform output s3_name의 결과>/next-server.zip ^
    --profile monthly-cs

예)
aws s3 cp                           ^
    --region us-east-1              ^
    ../../next-server.zip           ^
    s3://positive-guinea-monthly-cs-s3-bucket/next-server.zip ^
    --profile monthly-cs
```

- MacOS, Linux

```cmd
aws s3 cp                           \
    --region us-east-1              \
    ../../next-server.zip           \
    s3://<terraform output s3_name의 결과>/next-server.zip \
    --profile monthly-cs
```

### Server 배포하기

```
cd ./infra/server # 만약 이미 server 폴더라면, 제외

terraform output s3_name
terraform output codedeploy_app_name
terraform output codedeploy_deployment_name

aws deploy create-deployment                                                    ^
    --application-name <출력값 codedeploy_app_name>	                            ^
    --deployment-group-name <출력값 codedeploy_deployment_name>	                ^
    --s3-location bucket=<출력값 s3_name>,bundleType=zip,key=next-server.zip    ^
    --profile monthly-cs

예)
aws deploy create-deployment                                                                        ^
    --application-name monthly-cs-codedeploy-app	                                                ^
    --deployment-group-name monthly-cs-codedeploy-deployment	                                    ^
    --s3-location bucket=full-cow-monthly-cs-s3-bucket,bundleType=zip,key=next-server.zip           ^
    --profile monthly-cs
```


## 리소스 정리하기

### 버킷 비우기

```
aws s3 rm s3://<출력값 codedeploy_deployment_name> --recursive

예)
aws s3 rm s3://positive-guinea-monthly-cs-s3-bucket --recursive --profile monthly-cs
```

### Server 지우기

```
cd ./infra/server

terraform destroy -var="profile=monthly-cs" -var="domain_name=<가비아에서 구매한 도메인 이름>" -var="ami_id=<Packer로 생성된 AMI ID>"

terraform destroy -var="profile=monthly-cs" -var="domain_name=unchaptered.shop" -var="ami_id=ami-0ba253c2f6060b6c7"
```