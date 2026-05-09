variable "environment" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "sg_lb_id" {
  type = string
}

variable "ec2_1_id" {
  type = string
}

variable "ec2_2_id" {
  type = string
}