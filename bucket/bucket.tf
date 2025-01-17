provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "stierli-grupo4-a"
    lifecycle {
      prevent_destroy = true
    }
        versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
    object_lock_configuration {
        object_lock_enabled = "Enabled"
    }
    tags = {
        Name = "S3 Remote Terraform State Store"
    }
}


resource "aws_dynamodb_table" "terraform-lock" {
    lifecycle {
      prevent_destroy = true
    }
    name           = "terraformstatelock"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}