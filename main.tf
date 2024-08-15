module "s3_replication" {
  source = "./modules/s3_replication"

  source_bucket_name = var.source_bucket_name
  source_region      = var.source_region
  dest_bucket_name   = var.dest_bucket_name
  dest_region        = var.dest_region
}

module "iam_replication" {
  source = "./modules/iam_replication"

  source_bucket_name = var.source_bucket_name
  dest_bucket_name   = var.dest_bucket_name
  source_bucket_arn  = module.s3_replication.source_bucket.arn
  dest_bucket_arn    = module.s3_replication.dest_bucket.arn
}

module "replication_rule" {
  source = "./modules/rule_replication"

  source_bucket_arn    = module.s3_replication.source_bucket
  dest_bucket_arn      = module.s3_replication.dest_bucket
  iam_replication_role = module.iam_replication.iam_replication_role
  bucket_versioning    = module.s3_replication.bucket_versioning
}

module "name_ecr" {
  source = "./modules/ECR"

  name_ecr = var.name_ecr
}
module "secret_manager" {
  source = "./modules/secret_manager"
}
