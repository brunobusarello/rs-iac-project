output "ec2_public_ips" {
  value = module.ec2.public_ips
}

output "lb_public_ip" {
  value = module.loadbalancer.public_ip
}