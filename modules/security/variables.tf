variable "environment" {
  description = "Nome do ambiente"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "my_ip" {
  description = "IP autorizado para SSH"
  type        = string
  default     = "0.0.0.0/0"
}