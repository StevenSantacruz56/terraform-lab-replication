variable "name_ecr" {
  description = "Name of the ECR repository"
  default     = "test-ecr"
}

variable "region_replication" {
  description = "Region to replicate the ECR repository"
  default     = "us-east-1"
}
