output "nlb_arn" {
  description = "The ARN of the Network Load Balancer"
  value = module.network_load_balancer.nlb_arn
}

output "nlb_dns_name" {
  description = "The DNS name of the Network Load Balancer"
  value = module.network_load_balancer.nlb_dns_name
}

output "listener_arn" {
  description = "The ARN of the listener"
  value = module.network_load_balancer.listener_arn
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value = module.network_load_balancer.target_group_arn
}