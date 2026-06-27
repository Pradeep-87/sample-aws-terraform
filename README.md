# sample-aws-terraform

This repository contains a sample Terraform project to provision an AWS S3 bucket, plus Jenkins CI/CD configuration and a Docker/LocalStack setup for local provisioning.

## What is included

- `terraform/` — Terraform configuration for AWS S3 bucket creation
- `Jenkinsfile.ci` — Jenkins pipeline for CI validation
- `Jenkinsfile.cd` — Jenkins pipeline for Terraform provisioning
- `Dockerfile` — Jenkins image with Terraform and LocalStack support
- `docker-compose.yml` — LocalStack and Jenkins services for local development

## Terraform resources

The Terraform configuration creates:

- `aws_s3_bucket.example`
  - private ACL
  - versioning enabled
  - server-side encryption with AES256
  - tags for `Name` and `Environment`

## Local development with Docker and LocalStack

This repository now supports running Jenkins and LocalStack locally.

### Start locally

```bash
docker compose up --build
```

This launches:

- Jenkins on `http://localhost:8080`
- LocalStack on `http://localhost:4566`

### Environment in Docker

The container environment points Terraform to LocalStack:

- `AWS_DEFAULT_REGION=us-east-1`
- `AWS_ACCESS_KEY_ID=test`
- `AWS_SECRET_ACCESS_KEY=test`
- S3 endpoint: `http://localstack:4566`

## Jenkins CI/CD

### CI pipeline (`Jenkinsfile.ci`)

The CI pipeline performs:

- repository checkout
- `terraform init`
- `terraform fmt -check`
- `terraform validate`
- `terraform plan`

### CD pipeline (`Jenkinsfile.cd`)

The CD pipeline performs:

- repository checkout
- `terraform init`
- `terraform apply -auto-approve`

## Terraform configuration files

The current Terraform files include:

- `terraform/providers.tf` — provider config with LocalStack endpoint support
- `terraform/backend.tf` — local backend
- `terraform/locals.tf` — variables for AWS credentials, region, bucket name, and LocalStack endpoint
- `terraform/main.tf` — S3 bucket resource definition
- `terraform/outputs.tf` — outputs for bucket ARN and name

## Usage

1. Set a unique bucket name in `terraform/locals.tf` or pass it via CLI/environment.
2. Run Terraform locally or through Jenkins.

Example CLI commands:

```bash
cd terraform
terraform init
terraform apply -auto-approve -var='bucket_name=my-unique-bucket-name'
```

## Notes

- LocalStack is used only for local testing and provisioning.
- For real AWS deployment, update `terraform/providers.tf` to remove LocalStack endpoint settings and provide valid AWS credentials.
