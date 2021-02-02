#Configure Terragrunt to automatically store tfstate files in S3
remote_state {
    backend = "s3"

    config = {
        bucket = "terraform-up-and-running-state-set"
        key = "global/s3/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        dynamodb_table = "my_global_lock_table"
    }
}

