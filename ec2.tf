resource "aws_instance" "web" {
  ami           = "ami-00c39f71452c08778" # Amazon Linux 2 AMI
  instance_type = var.instance_type
  subnet_id     = element(aws_subnet.main.*.id, 0)

  tags = {
    Name = "web-server"
  }
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = aws_subnet.main[*].id
  launch_configuration = aws_launch_configuration.lc.id

  tag {
    key                 = "Name"
    value               = "web-server-asg"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "lc" {
  name          = "web-server-lc"
  image_id      = "ami-00c39f71452c08778"
  instance_type = var.instance_type
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}
