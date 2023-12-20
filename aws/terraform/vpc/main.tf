terraform {
  backend "s3" {
    bucket                  = "marklearnsdevops"
    key                     = "vpc-terraform.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "C:/Users/mark.aries.n.baysa/.aws/credentials"
  }
}
##
provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["C:/Users/mark.aries.n.baysa/.aws/config"]      ##Create using aws configure
  shared_credentials_files = ["C:/Users/mark.aries.n.baysa/.aws/credentials"] ##Create using aws configure
  profile                  = "default"
}

## Create VPC
resource "aws_vpc" "eus" {
  cidr_block       = "20.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "eus-1-vpc"
  }
}

## Create Internet Gateway
resource "aws_internet_gateway" "eus_igw" {
  vpc_id = aws_vpc.eus.id

  tags = {
    Name = "eus-1-igw"
  }
}

## Another way to create Internet Gateway and attach to VPC
#resource "aws_internet_gateway_attachment" "igw-attach" {
#  internet_gateway_id = aws_internet_gateway.eus_igw.id
#  vpc_id              = aws_vpc.eus.id
#}

## Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.eus.id
  cidr_block              = "20.0.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_Subnet"
  }
}

## Create Route Table
resource "aws_route_table" "eus-rtb" {
  vpc_id = aws_vpc.eus.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eus_igw.id
  }

  tags = {
    Name = "eus-1-rtb"
  }
}

## Associate subnet to route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.eus-rtb.id
}
