variable "vpc_name" {
  type = string
  default = "vpc-rs-project"
  description = "Nome da VPC"
}

variable "network" {
  type = string
  default = "10.0.0.0/16"
  description = "Faixa da rede VPC"
}