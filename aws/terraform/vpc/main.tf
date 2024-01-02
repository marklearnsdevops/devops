terraform {
  backend "s3" {
    bucket                  = "marklearnsdevops"
    key                     = "vpc-terraform.tfstate"
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

## Create VPC
resource "aws_vpc" "eus" {
  cidr_block       =  var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

## Create Internet Gateway
resource "aws_internet_gateway" "eus_igw" {
  vpc_id = aws_vpc.eus.id

  tags = {
    Name = var.igw_name
  }
}

## Another way to create Internet Gateway and attach to VPC
#resource "aws_internet_gateway_attachment" "igw-attach" {
#  internet_gateway_id = aws_internet_gateway.eus_igw.id
#  vpc_id              = aws_vpc.eus.id
#}

## Create Public Subnet (add more subnet blocks if needed)
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.eus.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.subnet1_name
  }
}

## Create Route Table
resource "aws_route_table" "eus-rtb" {
  vpc_id = aws_vpc.eus.id

  route {
    cidr_block = var.rtb
    gateway_id = aws_internet_gateway.eus_igw.id
  }

  tags = {
    Name = var.rtb_name
  }
}

## Associate subnet to route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.eus-rtb.id
}
