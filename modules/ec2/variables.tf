variable "app_name" {}
variable "bucket_name" {}
variable "public_subnets" {}
variable "alb_target_group_arn" {}

variable "key_name" {
  default = "talentxiac_keypair.pub"
  description = "Name of the SSH key pair to use for EC2 instances"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to access SSH on EC2 instances"
  default     = "0.0.0.0/0" # Replace with your IP or a restricted CIDR for better security
}

variable "vpc_id" {
  description = "The ID of the VPC where EC2 instances will be deployed"
  type        = string
}
