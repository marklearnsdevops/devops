## Sample template to create S3 Bucket only ##

terraform {
  backend "s3" {
    bucket                  = "marklearnsdevops"
    key                     = "s3only-terraform.tfstate"
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

# Create S3 bucket with private ACL
resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.mybucket.id
  rule {
    object_ownership = var.bucket_ownership
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.mybucket.id
    acl = var.acl
}


# Create S3 bucket with public ACL
# resource "aws_s3_bucket_ownership_controls" "ownership" {
#   bucket = aws_s3_bucket.mybucket.id
#   rule {
#     object_ownership = var.bucket_ownership
#   }
# }

# resource "aws_s3_bucket_public_access_block" "public" {
#   bucket = aws_s3_bucket.mybucket.id

#   block_public_acls = false
#   block_public_policy = false
#   ignore_public_acls = false
#   restrict_public_buckets = false
# }

# resource "aws_s3_bucket_acl" "acl" {
#   depends_on = [
#     aws_s3_bucket_ownership_controls.ownership,
#     aws_s3_bucket_public_access_block.public,
#    ]

#    bucket = aws_s3_bucket.mybucket.id
#    acl = var.acl
# }
