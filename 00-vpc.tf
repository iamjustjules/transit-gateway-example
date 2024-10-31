# Production VPC
resource "aws_vpc" "prod" {
  cidr_block = "10.100.0.0/16"
  tags       = { Name = "Prod_VPC" }
}

resource "aws_subnet" "prod_public" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = "10.100.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags                    = { Name = "Prod_Public_Subnet" }
}

resource "aws_subnet" "prod_private" {
  vpc_id            = aws_vpc.prod.id
  cidr_block        = "10.100.2.0/24"
  availability_zone = "us-east-1a"
  tags              = { Name = "Prod_Private_Subnet" }
}

# Development VPC
resource "aws_vpc" "dev" {
  cidr_block = "10.101.0.0/16"
  tags       = { Name = "Dev_VPC" }
}

resource "aws_subnet" "dev_public" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.101.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags                    = { Name = "Dev_Public_Subnet" }
}

resource "aws_subnet" "dev_private" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "10.101.2.0/24"
  availability_zone = "us-east-1a"
  tags              = { Name = "Dev_Private_Subnet" }
}

# Test VPC
resource "aws_vpc" "test" {
  cidr_block = "10.102.0.0/16"
  tags       = { Name = "Test_VPC" }
}

resource "aws_subnet" "test_public" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = "10.102.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags                    = { Name = "Test_Public_Subnet" }
}

resource "aws_subnet" "test_private" {
  vpc_id            = aws_vpc.test.id
  cidr_block        = "10.102.2.0/24"
  availability_zone = "us-east-1a"
  tags              = { Name = "Test_Private_Subnet" }
}
