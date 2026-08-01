# ecom-dev-nat-01 생성
resource "aws_nat_gateway" "ecom_dev_nat_01" {
    allocation_id = aws_eip.ecom_dev_eip_01.id
    subnet_id = aws_subnet.ecom_dev_pub_subnet_01.id
    
    tags = {
        Name = "ecom-dev-nat-01"
        env = "dev"
        Owner = "2313286"
    }
    depends_on = [aws_internet_gateway.ecom_dev_igw]
}

# ecom-dev-nat-02 생성
resource "aws_nat_gateway" "ecom_dev_nat_02" {
    allocation_id = aws_eip.ecom_dev_eip_02.id
    subnet_id = aws_subnet.ecom_dev_pub_subnet_02.id

    tags = {
        Name = "ecom-dev-nat-02"
        env = "dev"
        Owner = "2313286"
    }
    depends_on = [aws_internet_gateway.ecom_dev_igw]
}