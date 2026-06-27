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
