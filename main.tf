module "network" {
  source = "./modules/network"
}

module "security" {
  source = "./modules/security"

  environment = terraform.workspace
  vpc_id      = module.network.vpc_id
  my_ip       = "0.0.0.0/0"
}

module "ec2" {
  source = "./modules/ec2"

  environment           = terraform.workspace
  instance_type         = "t2.micro"
  public_subnet_ids     = [module.network.sub_pub_a_id, module.network.sub_pub_b_id]
  ec2_sg_id             = module.security.ec2_sg_id
  instance_profile_name = module.security.instance_profile_name
  key_name              = "brunobusarello-key"
  public_key_path       = "project-key.pub"
}