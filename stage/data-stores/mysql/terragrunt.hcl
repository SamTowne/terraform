#Configure Terragrunt to automatically store tfstate files in S3
remote_state {
    backend = "s3"

    config = {
        bucket = "terraform-up-and-running-state-set"
        key = "stage/data-stores/mysql/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        dynamodb_table = "my_stage_lock_table"
    }
}

