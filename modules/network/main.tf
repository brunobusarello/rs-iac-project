module "vpc" {
  source = "../vpc"
  network = "10.0.0.0/24"
  vpc_name = "vpc-rs-project-${terraform.workspace}"
}

module "sub_pub_a" {
  source = "../subnets"
  vpc_id = module.vpc.vpc_id

  sub_name = "sub_pub_a"
  range = "10.0.0.0/27"
}

module "sub_pub_b" {
  source = "../subnets"
  vpc_id = module.vpc.vpc_id

  sub_name = "sub_pub_b"
  range = "10.0.0.32/27"
}

module "sub_pri_a" {
  source = "../subnets"
  vpc_id = module.vpc.vpc_id

  sub_name = "sub_pri_a"
  range = "10.0.0.64/27"
}

module "sub_pri_b" {
  source = "../subnets"
  vpc_id = module.vpc.vpc_id

  sub_name = "sub_pri_b"
  range = "10.0.0.96/27"
}
