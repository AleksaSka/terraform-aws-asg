module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"
  # Autoscaling group
  name                      = var.name
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desire_size
  wait_for_capacity_timeout = 0
  health_check_type         = var.health_check_type
  # Launch template
  launch_template_name        = "wordpress"
  launch_template_description = "template-for-wordpress"
  vpc_zone_identifier         = var.vpc_subnets                      #data.terraform_remote_state.main.outputs.public_subnet_ids
  update_default_version      = true
  image_id                    = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  ebs_optimized               = true
  enable_monitoring           = true
  key_name                    = aws_key_pair.deployer.key_name
  security_groups             = [aws_security_group.defender.id]
  user_data_base64            = base64encode(data.template_file.user_data.rendered)
}