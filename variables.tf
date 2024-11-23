variable "region" {
  default = "us-east-1"
}

variable "app_name" {
  default = "talentxiac"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "route53_zone_id" {
  default = "Z03149023SW1A6YS2XJNV"
  description = "Route 53 hosted zone ID for the domain"
}

variable "key_name" {
  default = "talentxiac_keypair.pub"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to access SSH on EC2 instances"
  default     = "0.0.0.0/0" # Replace with your IP or a restricted CIDR for better security
}

variable "domain_name" {
  default = "talentx.digital"
}


