
variable "vpc_id" {
  type        = string
  description = "Id da VPC"
}

variable "route_gw_id" {
  type        = string
  description = "ID do Gateway"
}

variable "rt_name" {
  type        = string
  description = "Nome da Tabela de roteamento"
}

variable "route_type" {
  type        = string
  description = "Define o tipo de rota: pública, privada"
  validation {
    condition     = contains(["public", "private"], var.route_type)
    error_message = "route_type deve ser public ou private"
  }
}
