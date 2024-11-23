output "alb_dns_name" {
  value = module.alb.dns_name
}

output "route53_record" {
  value = module.route53.record
}
