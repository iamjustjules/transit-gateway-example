resource "aws_ec2_transit_gateway" "example" {
  description = "Example Transit Gateway"
  tags = { Name = "Example_Transit_Gateway" }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "prod_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = aws_vpc.prod.id
  subnet_ids         = [aws_subnet.prod_private.id]
}

resource "aws_route_table" "prod_private_route" {
  vpc_id = aws_vpc.prod.id

  route {
    cidr_block         = "10.200.0.0/16" # Use a non-overlapping CIDR block
    transit_gateway_id = aws_ec2_transit_gateway.example.id
  }

  tags = { Name = "Prod_Private_Route" }
}
