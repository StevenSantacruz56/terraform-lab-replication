output "source_bucket" {
  value = aws_s3_bucket.lab
}

output "dest_bucket" {
  value = aws_s3_bucket.lab_replication
}

output "bucket_versioning" {
  value = aws_s3_bucket_versioning.lab
}
