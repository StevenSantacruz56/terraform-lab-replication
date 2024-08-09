# Provider y version de Terraform

terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">4.12"
      configuration_aliases = [aws, aws.source, aws.dest]
    }
  }
}


provider "aws" {
  profile = var.profile
  region  = var.source_region
  default_tags {
    tags = {
      Project = "${var.project}"
      Owner   = "${var.profile}"
      DC      = "${var.source_region}"
    }
  }
}

provider "aws" {
  region  = var.source_region
  alias   = "source"
  profile = var.profile
  default_tags {
    tags = {
      Project = "${var.project}"
      Owner   = "${var.profile}"
      DC      = "${var.source_region}"
    }
  }
}

provider "aws" {
  region  = var.dest_region
  alias   = "dest"
  profile = var.profile
  default_tags {
    tags = {
      Project = "${var.project}"
      Owner   = "${var.profile}"
      DC      = "${var.dest_region}"
    }
  }
}
