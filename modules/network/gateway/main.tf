resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.gw_name
  }
}

variable "vpc_id" {
  type = string
  description = "ID da VPC original"
}

variable "gw_name" {
  type = string
  default = "main"
  description = "Nome do gateway"
}

output "gw_id" {
  value = aws_internet_gateway.gw.id
  sensitive = false
  description = "ID do gateway gerado"
}