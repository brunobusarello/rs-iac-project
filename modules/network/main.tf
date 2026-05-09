module "vpc" {
  source   = "./vpc"
  network  = "10.0.0.0/24"
  vpc_name = "vpc-rs-project-${terraform.workspace}"
}

module "sub_pub_a" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
  public = true

  az = "us-east-1a"

  sub_name = "sub_pub_a"
  range    = "10.0.0.0/27"
}

module "sub_pub_b" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
  public = true

  az = "us-east-1b"

  sub_name = "sub_pub_b"
  range    = "10.0.0.32/27"
}

module "sub_pri_a" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
  public = false

  az = "us-east-1a"

  sub_name = "sub_pri_a"
  range    = "10.0.0.64/27"
}

module "sub_pri_b" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
  public = false

  az = "us-east-1b"

  sub_name = "sub_pri_b"
  range    = "10.0.0.96/27"
}

module "gateway" {
  source = "./gateway"

  vpc_id = module.vpc.vpc_id

  gw_name = "gw_main"
}

module "public_rt" {
  source = "./routetable"

  vpc_id      = module.vpc.vpc_id
  route_gw_id = module.gateway.gw_id
  rt_name     = "rt-pub-${terraform.workspace}"
  route_type  = "public"
}

module "private_rt" {
  source = "./routetable"

  vpc_id      = module.vpc.vpc_id
  route_gw_id = null
  rt_name     = "rt-pri-${terraform.workspace}"
  route_type  = "private"
}

module "private_rta" {
  source = "./rt_association"

  sub_id = [module.sub_pri_a.sub_id, module.sub_pri_b.sub_id]
  rt_id  = module.private_rt.rt_id
}

module "public_rta" {
  source = "./rt_association"

  sub_id = [module.sub_pub_a.sub_id, module.sub_pub_b.sub_id]
  rt_id  = module.public_rt.rt_id
}
