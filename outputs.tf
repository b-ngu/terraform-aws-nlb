output "nlb_arn" {
  description = "The ARN of the Network Load Balancer"
  value       = aws_lb.this.arn
}

output "nlb_dns_name" {
  description = "The DNS name of the Network Load Balancer"
  value       = aws_lb.this.dns_name
}

output "listener_arns" {
  description = "The ARNs of the listeners"
  value = { for k, listener in aws_lb_listener.this : k => listener.arn }
}

output "target_group_arns" {
  description = "A map of target group names to their ARNs"
  value = { for idx, tg in aws_lb_target_group.this : tg.name => tg.arn }
}