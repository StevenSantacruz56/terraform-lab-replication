variable "source_region" {
  description = "AWS Deployment region.."
  default     = "us-east-1"
}

variable "dest_region" {
  description = "AWS Deployment region.."
  default     = "us-east-1"
}

variable "source_bucket_name" {
  description = "Your Source Bucket Name"
  default     = "test-bucket-source"
}

variable "dest_bucket_name" {
  description = "Your Destination Bucket Name"
  default     = "test-bucket-destination"
}

variable "profile" {
  description = "Profile to account AWS"
  default     = "aws-lab"
}
variable "project" {
  description = "Name Project"
  default     = "lab-terraform"
}

variable "name_ecr" {
  description = "Name Project"
  default     = "test-ecr"
}