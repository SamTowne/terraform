provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state"{
    bucket = "terraform-up-and-running-state-set"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }
}

terraform {
    backend "s3" {
        bucket = "terraform-up-and-running-state-set"
        region = "us-east-1"
        key = "global/s3/mysql/terraform.tfstate"
        encrypt = true
        dynamodb_table = "my-global-lock-table"
    }
}

