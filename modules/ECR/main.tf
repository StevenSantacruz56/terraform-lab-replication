resource "aws_ecr_repository" "lab" {
  name                 = var.name_ecr
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

data "aws_caller_identity" "current" {}

resource "aws_ecr_replication_configuration" "example" {
  replication_configuration {
    rule {
      destination {
        region      = var.region_replication
        registry_id = data.aws_caller_identity.current.account_id
      }

      repository_filter {
        filter      = "test-"
        filter_type = "PREFIX_MATCH"
      }
    }
  }
}
