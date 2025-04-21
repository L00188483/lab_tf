resource "aws_security_group" "alb_sg" {
  name        = "ALBSecurityGroup"
  description = "Allow HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "public_sg" {
  name        = "PublicSecurityGroup"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_http_sg" {
  name        = "PrivateHTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port                = 80
    to_port                  = 80
    protocol                 = "tcp"
    security_groups          = [aws_security_group.alb_sg.id, aws_security_group.public_sg.id]
  }
}

resource "aws_security_group" "private_ssh_sg" {
  name        = "PrivateSSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port                = 22
    to_port                  = 22
    protocol                 = "tcp"
    security_groups          = [aws_security_group.public_sg.id]
  }
}
