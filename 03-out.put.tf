output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.example.id
}

output "transit_gateway_vpc_attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.prod_attachment.id
}
