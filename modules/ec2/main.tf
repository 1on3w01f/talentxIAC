resource "aws_launch_template" "app" {
  name = "${var.app_name}-lt"
  image_id      = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"

  key_name = var.key_name

  network_interfaces {
    security_groups = [aws_security_group.app.id]
  }

  user_data = base64encode(<<-EOF
#!/bin/bash
yum update -y
yum install -y httpd
aws s3 cp s3://${var.bucket_name}/ /var/www/html/ --recursive --no-sign-request
systemctl enable httpd
systemctl start httpd
EOF
  )
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity = 2
  max_size         = 4
  min_size         = 1
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
  vpc_zone_identifier = var.public_subnets
  target_group_arns   = [var.alb_target_group_arn]
}

resource "aws_security_group" "app" {
  name        = "${var.app_name}-sg"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id

  # Allow inbound SSH traffic from your IP
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  # Allow inbound HTTP traffic
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-sg"
  }
}
