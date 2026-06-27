variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Unique name for the S3 bucket. Must be globally unique."
  type        = string
}

variable "environment" {
  description = "Deployment environment label for tags"
  type        = string
  default     = "dev"
}

variable "aws_access_key" {
  description = "Access key for LocalStack or AWS"
  type        = string
  default     = "test"
}

variable "aws_secret_key" {
  description = "Secret key for LocalStack or AWS"
  type        = string
  default     = "test"
}

variable "aws_s3_endpoint" {
  description = "S3 endpoint for LocalStack or AWS"
  type        = string
  default     = "http://localstack:4566"
}
