# Provider block
variable "region" {
    default = "us-east-1"
}
variable "shared_config_files" {}
variable "shared_credentials_files" {}
variable "profile" {
    default = "default"
}

# VPC resource block
variable "vpc_cidr" {}

# Subnet resource block
variable "subnet1_cidr" {}
variable "map_public_ip_on_launch" {}

# Route table resource block
variable "rtb" {}

# Tags variable
variable "vpc_name" {}
variable "igw_name" {}
variable "subnet1_name" {}
variable "rtb_name" {}