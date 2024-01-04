## Sample template to create S3 Bucket only ##

terraform {
  backend "s3" {
    bucket                  = "marklearnsdevops"
    key                     = "s3withversioning-terraform.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "C:/Users/mark.aries.n.baysa/.aws/credentials"
  }
}

## AWS Provider
provider "aws" {
  region                   = var.region
  shared_config_files      = var.shared_config_files      ##Create using aws configure
  shared_credentials_files = var.shared_credentials_files ##Create using aws configure
  profile                  = var.profile
}

# Create S3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname

  tags = {
    Name = var.bucketname
  }
}

# Set S3 bucket ACL
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.mybucket.id
  acl    = var.acl
}

# Enable/disable versioning status in S3 bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.mybucket.id
  versioning_configuration {
    status = var.status
  }
}

