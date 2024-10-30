resource "aws_vpc" "prod" {
  cidr_block = "10.100.0.0/16"
  tags = { Name = "Prod_VPC" }
}

resource "aws_subnet" "prod_public" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = "10.100.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = { Name = "Prod_Public_Subnet" }
}

resource "aws_subnet" "prod_private" {
  vpc_id            = aws_vpc.prod.id
  cidr_block        = "10.100.2.0/24"
  availability_zone = "us-east-1a"
  tags = { Name = "Prod_Private_Subnet" }
}
