resource "aws_s3_bucket" "lab" {
  bucket        = var.source_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket" "lab_replication" {
  bucket        = var.dest_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "lab" {
  for_each = {
    lab             = aws_s3_bucket.lab.id
    lab_replication = aws_s3_bucket.lab_replication.id
  }

  bucket = each.value
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "lab" {
  for_each = {
    lab             = aws_s3_bucket.lab.id
    lab_replication = aws_s3_bucket.lab_replication.id
  }

  bucket                  = each.value
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "lab" {
  for_each = {
    lab             = aws_s3_bucket.lab.id
    lab_replication = aws_s3_bucket.lab_replication.id
  }

  bucket                  = each.value
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}