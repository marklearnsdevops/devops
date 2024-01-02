# Provider block
#region = "us-east-1"
shared_config_files      = ["C:/Users/mark.aries.n.baysa/.aws/config"]
shared_credentials_files = ["C:/Users/mark.aries.n.baysa/.aws/credentials"]
#profile = "default"


#AWS instance resource block
ami = "ami-023c11a32b0207432"
#associate_public_ip_address = true
instance_type   = "t2.micro"
key_name        = "euskp"
private_ip      = "10.0.0.5"
security_groups = ["sg-04d90a2d6cd70867b"]
subnet_id       = "subnet-0a41233dbaaf4c0fa"

# Root block device
root_size = "10"
root_type = "gp2"

# EBS - xvdb
device_name = "/dev/xvdb"
xvdb_size   = "5"
xvdb_type   = "gp2"


# EC2 Tags
ec2_name  = "slave"
root_name = "root_slave"
xvdb_name = "xvdb_slave"