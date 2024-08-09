variable "source_bucket_arn" {
  description = "The ARN of the source S3 bucket"
}

variable "dest_bucket_arn" {
  description = "The ARN of the destination S3 bucket"
}

variable "iam_replication_role" {
  description = "The name of the IAM role for S3 replication"
}

variable "bucket_versioning" {
  description = "The versioning status of the S3 bucket"
}