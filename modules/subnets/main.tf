resource "aws_subnet" "subnets" {
  vpc_id = var.vpc_id

  cidr_block = var.range

  tags = {
    Name = var.sub_name
  }
}