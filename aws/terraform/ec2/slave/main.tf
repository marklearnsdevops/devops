terraform {
  backend "s3" {
    bucket                  = "marklearnsdevops"
    key                     = "master-terraform.tfstate"
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

resource "aws_instance" "master" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = var.instance_type
  key_name                    = var.key_name
  private_ip                  = var.private_ip
  security_groups             = var.security_groups
  subnet_id                   = var.subnet_id

  tags = {
    Name = var.ec2_name
  }

  root_block_device {
    delete_on_termination = var.delete_on_termination
    volume_size           = var.root_size
    volume_type           = var.root_type
    encrypted             = var.encrypted
    #kms_key_id            = "aws/ebs"

    tags = {
      Name = var.root_name
    }
  }

  ebs_block_device {
    delete_on_termination = var.delete_on_termination
    device_name           = var.device_name
    encrypted             = var.encrypted
    #kms_key_id            = "aws/ebs"
    volume_size = var.xvdb_size
    volume_type = var.xvdb_type

    tags = {
      Name = var.xvdb_name
    }
  }
}