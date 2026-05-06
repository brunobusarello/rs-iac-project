output "alb_sg_id" {
  description = "ID do security group do ALB"
  value       = aws_security_group.alb_sg.id
}

output "ec2_sg_id" {
  description = "ID do security group da EC2"
  value       = aws_security_group.ec2_sg.id
}

output "instance_profile_name" {
  description = "Nome do instance profile"
  value       = aws_iam_instance_profile.ec2_profile.name
}