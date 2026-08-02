resource "aws_vpc" "ecom_dev_vpc" {
    region = "ap-northeast-2"
    cidr_block = "172.16.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "ecom-dev-vpc"
        env = "dev"
        Owner = "2313286"
    }
}
resource "aws_internet_gateway" "ecom_dev_igw" {
    vpc_id = aws_vpc.ecom_dev_vpc.id
    
    tags = {
        Name = "ecom-dev-igw"
        env = "dev"
        Owner = "2313286"
    }
}