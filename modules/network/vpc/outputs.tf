output "vpc_id" {
  value = aws_vpc.main.id
  sensitive = false
  description = "ID da VPC"
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
  sensitive = false
  description = "IP da VPC"
}