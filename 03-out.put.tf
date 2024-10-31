output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.example.id
}

output "prod_transit_gateway_vpc_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.prod_attachment.id
}

output "dev_transit_gateway_vpc_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.dev_attachment.id
}

output "test_transit_gateway_vpc_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.test_attachment.id
}
