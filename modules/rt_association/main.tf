resource "aws_route_table_association" "rta" {
  for_each = toset(var.sub_id)

  subnet_id      = each.value
  route_table_id = var.rt_id
}

variable "sub_id" {
  type = list(string)
}

variable "rt_id" {
  type = string
}
