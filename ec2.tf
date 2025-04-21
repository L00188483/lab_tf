resource "aws_instance" "public_jumpbox" {
  ami                    = var.image_id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public1.id
  key_name               = var.ssh_key_pair
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              mkdir -p /var/www/html
              chmod -R 755 /var/www/html
              echo "Hello from EC2" > /var/www/html/index.html
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF
}

resource "aws_launch_template" "private_lt" {
  name_prefix   = "private-ec2-"
  image_id      = var.image_id
  instance_type = "t2.micro"
  key_name      = var.ssh_key_pair

  vpc_security_group_ids = [
    aws_security_group.private_http_sg.id,
    aws_security_group.private_ssh_sg.id
  ]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              mkdir -p /var/www/html
              chmod -R 755 /var/www/html
              echo "Hello from EC2" > /var/www/html/index.html
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF
  )
}

resource "aws_autoscaling_group" "private_asg" {
  desired_capacity     = var.instance_count
  max_size             = var.instance_count
  min_size             = var.instance_count
  vpc_zone_identifier  = [aws_subnet.private1.id, aws_subnet.private2.id]
  target_group_arns    = [aws_lb_target_group.app_tg.arn]

  launch_template {
    id      = aws_launch_template.private_lt.id
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}
