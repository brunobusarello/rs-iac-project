variable "environment" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "ec2_sg_id" {
  type = string
}

variable "instance_profile_name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "public_key_path" {
  type = string
}