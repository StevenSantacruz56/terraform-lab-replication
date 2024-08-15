variable "name_secret" {
  description = "Name of the ECR repository"
  default     = "test-secret"
}

variable "region_replication" {
  description = "Region to replicate the ECR repository"
  default     = "us-east-1"
}
