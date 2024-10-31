# Create the Transit Gateway
resource "aws_ec2_transit_gateway" "example" {
  description = "Example Transit Gateway"
  tags        = { Name = "Example_Transit_Gateway" }
}

# Attach Production VPC to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "prod_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = aws_vpc.prod.id
  subnet_ids         = [aws_subnet.prod_private.id]
}

# Attach Development VPC to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "dev_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = aws_vpc.dev.id
  subnet_ids         = [aws_subnet.dev_private.id]
}

# Attach Test VPC to Transit Gateway
resource "aws_ec2_transit_gateway_vpc_attachment" "test_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = aws_vpc.test.id
  subnet_ids         = [aws_subnet.test_private.id]
}

# Configure Route Table for Production Private Subnet
resource "aws_route_table" "prod_private_route" {
  vpc_id = aws_vpc.prod.id

  route {
    cidr_block         = "10.0.0.0/8" # Matches CIDR range for inter-VPC routing
    transit_gateway_id = aws_ec2_transit_gateway.example.id
  }

  tags = { Name = "Prod_Private_Route" }
}

# Additional Route Tables for Dev and Test Private Subnets
resource "aws_route_table" "dev_private_route" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block         = "10.0.0.0/8" # Matches CIDR range for inter-VPC routing
    transit_gateway_id = aws_ec2_transit_gateway.example.id
  }

  tags = { Name = "Dev_Private_Route" }
}

resource "aws_route_table" "test_private_route" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block         = "10.0.0.0/8" # Matches CIDR range for inter-VPC routing
    transit_gateway_id = aws_ec2_transit_gateway.example.id
  }

  tags = { Name = "Test_Private_Route" }
}
