terraform {
  backend "s3" {
    bucket = "project-wordpress-aws-final"
    key    = "project/team2/asg"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "main" {
  backend = "s3" 
    config = {
      bucket = "project-wordpress-aws-final"
      key    = "project/team1/vpc"
      region = "us-east-1"
  }
}

data "terraform_remote_state" "rds" {
  backend = "s3" 
    config = {
      bucket = "project-wordpress-aws-final"
      key    = "project/team3/rds"
      region = "us-east-1"
  }
}

data "template_file" "user_data" {
  template = file("user_data.tpl")
  vars = {
    db_username      = data.terraform_remote_state.rds.outputs.rds_cluster_username
    db_user_password = data.terraform_remote_state.rds.outputs.rds_cluster_password
    db_name          = data.terraform_remote_state.rds.outputs.rds_cluster_db_name
    db_RDS           = data.terraform_remote_state.rds.outputs.rds_cluster_endpoint
  }
}