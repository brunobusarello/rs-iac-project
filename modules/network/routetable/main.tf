resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.route_type == "public" ? [1] : []

    content {
      cidr_block = "0.0.0.0/0"
      gateway_id = var.route_gw_id
    }
  }

  tags = {
    Name = var.rt_name
  }
}
