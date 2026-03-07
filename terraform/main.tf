terraform {
  required_version = ">= 1.5"

  backend "s3" {
    bucket       = "terraform-state-naveen-1234567890"
    key          = "github-actions/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = "terraform-lock-table"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "terraform-demo-bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.example_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.example_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "sample_file" {
  bucket = aws_s3_bucket.example_bucket.id
  key    = "sample.txt"
  source = "${path.module}/sample.txt"

  etag = filemd5("${path.module}/sample.txt")
}