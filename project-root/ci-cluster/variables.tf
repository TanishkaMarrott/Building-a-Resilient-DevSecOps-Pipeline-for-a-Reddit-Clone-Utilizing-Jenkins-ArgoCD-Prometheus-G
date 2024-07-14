variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The VPC ID to deploy resources in"
  type        = string
}

variable "private_subnets" {
  description = "The private subnets to deploy resources in"
  type        = list(string)
}
