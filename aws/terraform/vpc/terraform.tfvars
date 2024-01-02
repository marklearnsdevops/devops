# Provider block
#region = "us-east-1"
shared_config_files = ["C:/Users/mark.aries.n.baysa/.aws/config"]
shared_credentials_files = ["C:/Users/mark.aries.n.baysa/.aws/credentials"]
#profile = "default"

# VPC resource block
vpc_cidr = "10.0.0.0/16"

# Subnet resource block
subnet1_cidr = "10.0.0.0/24"
map_public_ip_on_launch = true

# Route table resource block
rtb = "0.0.0.0/0"

# Tags
vpc_name = "eus-vpc"
igw_name = "eus-igw"
subnet1_name = "eus-pub-subnet"
rtb_name = "eus-rtb"