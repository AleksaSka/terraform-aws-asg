module "asg" {
    source = "../"

    
  ################## Region of landing ASG #################
  aws_region = "us-east-1"

  ################## Autoscaling group #################
  name = "wordpress"
  min_size = 1
  desire_size = 4
  max_size = 99
  health_check_type = "EC2"
  vpc_subnets = ["subnet-11223344", "subnet-44332211"]

  ################## Elastic Load Balancer #################
  elb_subnets = ["subnet-11223344", "subnet-44332211"]

  ################## Security Group #################
  sg_subnets = ["subnet-11223344", "subnet-44332211"]

  ################## Route53 #################
  ZONEID = "yourzoneid"
  DOMAIN = "yourdomain.com"
}