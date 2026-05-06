// Create main network
resource "aws_vpc" "main" {

  cidr_block = var.network

  tags = {
    Name = var.vpc_name
    env  = terraform.workspace
  }
}
