resource "aws_launch_template" "fleet_launch_template" {
  name                   = "fleet"
  image_id               = data.aws_ami.amazon-linux.id
  instance_type          = "t2.micro"
  update_default_version = true
  network_interfaces {
    subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)

  }

}

resource "aws_security_group" "" {

}
resource "aws_autoscaling_group" "name" {

}
resource "aws_lb_target_group" "name" {

}
resource "aws_lb_listener" "name" {

}

resource "aws_ec2_fleet" "example" {
  launch_template_config {
    launch_template_specification {
      
    }
  }

  target_capacity_specification {

  }
}
