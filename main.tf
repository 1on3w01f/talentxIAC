module "vpc" {
  source  = "./modules/vpc"
  region  = var.region
  app_name = var.app_name
  #vpc_cidr_block = var.vpc_cidr_block
  #public_subnets = var.public_subnets
}

module "s3" {
  source  = "./modules/s3"
  bucket_name = "${var.app_name}-bucket1"
}

module "alb" {
  source  = "./modules/alb"
  app_name = var.app_name
  vpc_id  = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "ec2" {
  source  = "./modules/ec2"
  app_name        = var.app_name
  key_name = var.key_name
  vpc_id = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
  public_subnets = module.vpc.public_subnets
  bucket_name   = "${var.app_name}-bucket1"
  alb_target_group_arn = module.alb.target_group_arn
}

module "route53" {
  source  = "./modules/route53"
  domain_name       = var.domain_name
  alb_dns_name      = module.alb.dns_name
  alb_zone_id       = module.alb.zone_id
  zone_id           = var.route53_zone_id
}
