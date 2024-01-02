# Backend
variable "region" {
  default = "us-east-1"
}
variable "shared_config_files" {}
variable "shared_credentials_files" {}
variable "profile" {
  default = "default"
}

# AWS instance resource block
variable "ami" {}
variable "associate_public_ip_address" {
  default = true
}
variable "instance_type" {}
variable "key_name" {}
variable "private_ip" {}
variable "security_groups" {}
variable "subnet_id" {}

# Root block device
variable "root_size" {}
variable "root_type" {}

# EBS - xvdb
variable "device_name" {
  default = "/dev/xvdb"
}
variable "xvdb_size" {}
variable "xvdb_type" {}

# EBS Global Configuration
variable "delete_on_termination" {
  default = true
}
variable "encrypted" {
  default = true
}


# Variable Tags
variable "ec2_name" {}
variable "root_name" {}
variable "xvdb_name" {}