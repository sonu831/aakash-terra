variable "prefix" {
  type = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform state storage"
  type        = string
}

variable "dynamodb_table" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
}

variable "region" {
  description = "AWS region for the backend resources"
  type        = string
  default     = "us-west-2"
}

variable "encrypt" {
  description = "Enable encryption for the S3 bucket"
  type        = bool
  default     = true
}

variable "key" {
  description = "Path to the state file in S3"
  type        = string
  default     = "terraform.tfstate"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}