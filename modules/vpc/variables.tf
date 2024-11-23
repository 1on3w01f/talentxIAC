variable "app_name" {}
variable "region" {}
variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}
variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

