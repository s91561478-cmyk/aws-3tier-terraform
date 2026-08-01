# ecom-dev-pub-rt 생성
resource "aws_route_table" "ecom_dev_pub_rt" {
    vpc_id = aws_vpc.ecom_dev_vpc.id

    tags = {
        Name = "ecom-dev-pub-rt"
        env = "dev"
        Owner = "2313286"
    }
}

# ecom-dev-pub-rt에 route 추가
resource "aws_route" "ecom_dev_pub_route" {
    route_table_id = aws_route_table.ecom_dev_pub_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ecom_dev_igw.id
}

# ecom-dev-pub-rt에 pub_subnet_01 연결
resource "aws_route_table_association" "ecom_dev_pub_rt_association_01" {
    subnet_id = aws_subnet.ecom_dev_pub_subnet_01.id
    route_table_id = aws_route_table.ecom_dev_pub_rt.id
}

# ecom-dev-pub-rt에 pub_subnet_02 연결
resource "aws_route_table_association" "ecom_dev_pub_rt_association_02" {
    subnet_id = aws_subnet.ecom_dev_pub_subnet_02.id
    route_table_id = aws_route_table.ecom_dev_pub_rt.id
}

# ecom-dev-app-rt-01 생성
resource "aws_route_table" "ecom_dev_app_rt_01" {
    vpc_id = aws_vpc.ecom_dev_vpc.id

    tags = {
        Name = "ecom-dev-app-rt-01"
        env = "dev"
        Owner = "2313286"
    }
}

# ecom-dev-app-rt-01에 route 추가
resource "aws_route" "ecom_dev_app_route_01" {
    route_table_id = aws_route_table.ecom_dev_app_rt_01.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ecom_dev_nat_01.id
}

# ecom-dev-app-rt-01에 app_subnet_01 연결
resource "aws_route_table_association" "ecom_dev_app_rt_01_association_01" {
    subnet_id = aws_subnet.ecom_dev_app_subnet_01.id
    route_table_id = aws_route_table.ecom_dev_app_rt_01.id
}

# ecom-dev-app-rt-02 생성
resource "aws_route_table" "ecom_dev_app_rt_02" {
    vpc_id = aws_vpc.ecom_dev_vpc.id

    tags = {
        Name = "ecom-dev-app-rt-02"
        env = "dev"
        Owner = "2313286"
    }
}

# ecom-dev-app-rt-02에 route 추가
resource "aws_route" "ecom_dev_app_route_02" {
    route_table_id = aws_route_table.ecom_dev_app_rt_02.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ecom_dev_nat_02.id
}

# ecom-dev-app-rt-02에 app_subnet_02 연결
resource "aws_route_table_association" "ecom_dev_app_rt_02_association_01" {
    subnet_id = aws_subnet.ecom_dev_app_subnet_02.id
    route_table_id = aws_route_table.ecom_dev_app_rt_02.id
}

# ecom-dev-db-rt 생성
resource "aws_route_table" "ecom_dev_db_rt" {
    vpc_id = aws_vpc.ecom_dev_vpc.id

    tags = {
        Name = "ecom-dev-db-rt"
        env = "dev"
        Owner = "2313286"
    }
}

# ecom-dev-db-rt에 db_subnet_01 연결
resource "aws_route_table_association" "ecom_dev_db_rt_01_association_01" {
    subnet_id = aws_subnet.ecom_dev_db_subnet_01.id
    route_table_id = aws_route_table.ecom_dev_db_rt.id
}

# ecom-dev-db-rt에 db_subnet_02 연결
resource "aws_route_table_association" "ecom_dev_db_rt_02_association_02" {
    subnet_id = aws_subnet.ecom_dev_db_subnet_02.id
    route_table_id = aws_route_table.ecom_dev_db_rt.id
}