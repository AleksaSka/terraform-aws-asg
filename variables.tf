####################################################################
# Region of launcing
####################################################################

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "null"
}

####################################################################
# Autoscailing group
####################################################################

variable "name" {
  description = "name used acrossed created ASG resources"
  type = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
  default     = null
}

variable "desire_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
  default     = null
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
  default     = null
}

variable "health_check_type" {
  description = "`EC2` or `ELB`. Controls how health checking is done"
  type        = string
  default     = null
}

variable "vpc_subnets" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
  default     = null
}

####################################################################
# Elastic Load Balancer
####################################################################

variable "elb_subnets" {
  description = "A list of subnet IDs to launch elb resource"
  type        = list(string)
  default     = null
}

####################################################################
# Security Group
####################################################################

variable "sg_subnets" {
  description = "A list of subnet IDs to launch elb resource"
  type        = list(string)
  default     = null
}

####################################################################
# Route53 information
####################################################################

variable "ZONEID" {
  description = "id of your domain host"
  type        = string
  default     = null                              #    "Z0797111NE21F45UKDAP"
}

variable "DOMAIN" {
  description = "your domain host"
  type        = string
  default     = null                              #     "fiefdomain.com"
}