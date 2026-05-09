variable "vpc_id" {
  type        = string
  description = "ID da VPC"
}

variable "range" {
  type        = string
  description = "Faixa da Subrede"
}

variable "sub_name" {
  type        = string
  description = "Nome da Subrede"
}

variable "public" {
  type = bool
  description = "Vai dizer se a subnet precisa de um ip público"
}