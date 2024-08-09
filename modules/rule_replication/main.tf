resource "aws_s3_bucket_replication_configuration" "lab" {
  depends_on = [var.bucket_versioning]

  role   = var.iam_replication_role.arn
  bucket = var.source_bucket_arn.id

  rule {
    id = "cross-replication"

    delete_marker_replication {
      status = "Disabled"
    }
    source_selection_criteria {
      replica_modifications {
        status = "Enabled"
      }
    }
    filter {
      prefix = ""
    }

    status = "Enabled"

    destination {
      bucket = var.dest_bucket_arn.arn

    }
  }
}

resource "aws_s3_bucket_replication_configuration" "lab_replication" {
  depends_on = [var.bucket_versioning]
  role   = var.iam_replication_role.arn
  bucket = var.dest_bucket_arn.id

  rule {
    id = "cross-replication"
    delete_marker_replication {
      status = "Disabled"
    }
    source_selection_criteria {
      replica_modifications {
        status = "Enabled"
      }
    }
    filter {
      prefix = ""
    }

    status = "Enabled"

    destination {
      bucket = var.source_bucket_arn.arn

    }
  }
}
