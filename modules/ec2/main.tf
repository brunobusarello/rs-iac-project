#########################################
# KEY PAIR
#########################################

resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

#########################################
# EC2 INSTANCES
#########################################

resource "aws_instance" "app_server" {
  count = 2

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_ids[count.index]
  vpc_security_group_ids = [var.ec2_sg_id]
  key_name               = aws_key_pair.ec2_key.key_name
  iam_instance_profile   = var.instance_profile_name

  associate_public_ip_address = true

  user_data = templatefile("${path.module}/userdata.sh", {
    environment = var.environment
  })

  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.environment}-app-server-${count.index + 1}"
    Environment = var.environment
  }
}

