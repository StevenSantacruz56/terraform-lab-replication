variable "source_bucket_name" {
  description = "Your Source Bucket Name"
  default     = "test-bucket-source"
}

variable "dest_bucket_name" {
  description = "Your Destination Bucket Name"
  default     = "test-bucket-destination"
}


variable "source_bucket_arn" {
  description = "The ARN of the source S3 bucket"
  type        = string
}


variable "dest_bucket_arn" {
  description = "The ARN of the destination S3 bucket"
  type        = string
}
