# ecom-dev-pub-subnet-01
resource "aws_subnet" "ecom_dev_pub_subnet_01" {
    vpc_id = aws_vpc.ecom_dev_vpc.id
    cidr_block = "172.16.0.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = true
    
    tags = {
        Name = "ecom-dev-pub-subnet-01"
        env = "dev"
        Owner = "2313286"
    }
}
# ecom-dev-pub-subnet-02
resource "aws_subnet" "ecom_dev_pub_subnet_02" {
    vpc_id = aws_vpc.ecom_dev_vpc.id
    cidr_block = "172.16.2.0/24"
    availability_zone = "ap-northeast-2c"
    map_public_ip_on_launch = true

    tags = {
        Name = "ecom-dev-pub-subnet-02"
        env = "dev"
        Owner = "2313286"
    }
}
# ecom-dev-app-subnet-01
resource "aws_subnet" "ecom_dev_app_subnet_01" {
    vpc_id = aws_vpc.ecom_dev_vpc.id
    cidr_block = "172.16.11.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = false

    tags = {
        Name = "ecom-dev-app-subnet-01"
        env = "dev"
        Owner = "2313286"
    }
}
# ecom-dev-app-subnet-02
resource "aws_subnet" "ecom_dev_app_subnet_02" {
    vpc_id = aws_vpc.ecom_dev_vpc.id
    cidr_block = "172.16.12.0/24"
    availability_zone = "ap-northeast-2c"
    map_public_ip_on_launch = false

    tags = {
        Name = "ecom-dev-app-subnet-02"
        env = "dev"
        Owner = "2313286"
    }
}
# ecom-dev-db-subnet-01
resource "aws_subnet" "ecom_dev_db_subnet_01" {
    vpc_id = aws_vpc.ecom_dev_vpc.id
    cidr_block = "172.16.21.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = false

    tags = {
        Name = "ecom-dev-db-subnet-01"
        env = "dev"
        Owner = "2313286"
    }
}
# ecom-dev-db-subnet-02
resource "aws_subnet" "ecom_dev_db_subnet_02" {
    vpc_id = aws_vpc.ecom_dev_vpc.id
    cidr_block = "172.16.22.0/24"
    availability_zone = "ap-northeast-2c"
    map_public_ip_on_launch = false

    tags = {
        Name = "ecom-dev-db-subnet-02"
        env = "dev"
        Owner = "2313286"
    }
}