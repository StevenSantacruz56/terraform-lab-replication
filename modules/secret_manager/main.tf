resource "aws_secretsmanager_secret" "example" {
  name = var.name_secret
  replica {
    region = var.region_replication
  }
}
